require "rails_helper"

describe PayForSubscription, :vcr do
  describe "#call" do
    let!(:author) { create :user, subscription_prices: subscription_prices }
    let(:subscription_prices) { { weekly_subscription_price: 7 } }

    let(:initial_context) do
      {
        subscription_type: subscription_type,
        author_id: author.id,
        stripe_token: stripe_token
      }
    end

    let(:subscription_type) { "weekly_subscription_price" }

    subject(:result) { described_class.call(initial_context) }

    context "without Stripe errors" do
      let(:stripe_token) { "valid_token" }

      it "charges for subscription" do
      end
    end

    context "with Stripe error" do
      let(:stripe_token) { "invalid_token" }

      it "raises charge error" do
      end
    end
  end
end
