require "rails_helper"

describe CreateSubscription do
  describe "#call" do
    let(:current_user) { create :user }
    let!(:author) { create :user, subscription_prices: subscription_prices }
    let(:subscription_prices) { { weekly_subscription_price: 7 } }
    let(:subscription_type) { "weekly_subscription_price" }
    let(:charge) { { "id" => "charge_id" } }

    let(:context) do
      {
        current_user_id: current_user.id,
        author_id: author.id,
        subscription_type: subscription_type,
        charge: charge
      }
    end

    subject(:result) { described_class.call(context) }

    context "when subscription valid" do
      it "creates subscription" do
        expect(result.success?).to be_truthy
      end
    end

    context "when subscription invalid" do
      let(:author) { build :user }

      it "returns error message" do
        expect(result.success?).to be_falsey
        expect(result.message).to be_present
      end
    end
  end
end
