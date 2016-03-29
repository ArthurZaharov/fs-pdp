require "rails_helper"

describe AuthorsWithinRadiusQuery, :vcr do
  let!(:new_york_user) { create :user, :in_new_york }
  let!(:new_orleans_user) { create :user, :in_new_orleans }

  describe "#all" do
    subject(:all) { described_class.new(center: center, radius: radius).all }

    context "with empty params" do
      let(:center) { nil }
      let(:radius) { nil }

      it "returns New Orleans users" do
        expect(all).to match_array([new_orleans_user])
      end
    end

    context "with center in New York" do
      let(:center) { [40.712784, -74.005941] }

      context "without radius" do
        let(:radius) { nil }

        it "returns New York users" do
          expect(all).to match_array([new_york_user])
        end
      end

      context "with large radius" do
        let(:radius) { 1000 }

        it "returns New York and New Orleans users" do
          expect(all).to match_array([new_york_user, new_orleans_user])
        end
      end
    end
  end
end
