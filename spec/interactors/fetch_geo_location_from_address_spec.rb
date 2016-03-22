require "rails_helper"

describe FetchGeoLocationFromAddress, :vcr do
  let(:default_location) { { latitude: "25.215062", longitude: "55.190368" } }

  describe "Fetching geolocation" do
    subject(:geo_location) { described_class.call(geo_params: geo_params).geo_location }

    context "with all empty fields" do
      let(:geo_params) { { country: "", city: "", address: "" } }

      it "returns default coordinates" do
        expect(geo_location).to eq(default_location)
      end
    end

    context "with unrecognized country" do
      let(:geo_params) { { country: "Fake country" } }

      it "returns default coordinates" do
        expect(geo_location).to eq(default_location)
      end
    end

    context "with not all params" do
      let(:geo_params) { { country: "USA", city: "New Orleans" } }
      let(:new_orleans_location) { { latitude: 29.95106579999999, longitude: -90.0715323 } }

      it "returns city default coordinates" do
        expect(geo_location).to eq(new_orleans_location)
      end
    end

    context "with all params" do
      let(:geo_params) { { country: "USA", city: "New Orleans", address: "2309 Clouet St" } }
      let(:street_location) { { latitude: 29.980104, longitude: -90.04019699999999 } }

      it "returns address coordinates" do
        expect(geo_location).to eq(street_location)
      end
    end
  end
end
