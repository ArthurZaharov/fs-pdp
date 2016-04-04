require "rails_helper"

describe AuthorsWithinBoundingBoxQuery, :vcr do
  let!(:new_york_user) { create :user, :in_new_york }
  let!(:new_orleans_user) { create :user, :in_new_orleans }

  describe "#all" do
    subject(:all) { described_class.new(search).all }

    context "with empty params" do
      let(:search) { nil }

      it "returns empty set" do
        expect(all.size).to eq(0)
      end
    end

    context "with search params" do
      let(:search) { { sw_point: sw_point, ne_point: ne_point } }

      context "with one empty param" do
        let(:sw_point) { { lat: 40.532296, lng: -74.314957 } }
        let(:ne_point) { nil }

        it "returns empty set" do
          expect(all.size).to eq(0)
        end
      end

      context "with narrow box" do
        let(:sw_point) { { lat: 40.532296, lng: -74.314957 } }
        let(:ne_point) { { lat: 40.848846, lng: -73.604965 } }

        it "returns New York users" do
          expect(all).to match_array([new_york_user])
        end
      end

      context "with wide box" do
        let(:sw_point) { { lat: 29.357641, lng: -91.021729 } }
        let(:ne_point) { { lat: 41.190540, lng: -73.070068 } }

        it "returns New York and New Orleans users" do
          expect(all).to match_array([new_york_user, new_orleans_user])
        end
      end
    end
  end
end
