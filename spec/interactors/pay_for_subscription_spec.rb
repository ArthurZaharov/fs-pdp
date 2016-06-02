require "rails_helper"

describe PayForSubscription do
  describe "#call" do
    let!(:author) { create :user, subscription_prices: subscription_prices }
    let(:subscription_prices) { { weekly_subscription_price: 7 } }
    let(:subscription_type) { "weekly_subscription_price" }

    let(:context) do
      {
        subscription_type: subscription_type,
        author_id: author.id,
        stripe_token: "stripe_token"
      }
    end

    subject(:result) { described_class.call(context) }

    context "without Stripe errors" do
      let(:charge) { { "id" => "charge_id" } }

      before do
        allow(Stripe::Charge).to receive(:create).and_return(charge)
      end

      it "charges for subscription" do
        expect(result.success?).to be_truthy
        expect(result.charge).to be_present
      end
    end

    context "with Stripe error" do
      let(:card_error) { Stripe::CardError.new("card error", "", 500) }

      before do
        allow(Stripe::Charge).to receive(:create).and_raise(card_error)
      end

      it "raises charge error" do
        expect(result.success?).to be_falsey
        expect(result.message).to be_present
      end
    end
  end
end
