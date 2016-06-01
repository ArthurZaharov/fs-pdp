require "rails_helper"

describe User do
  describe "#paid_subscriptions?" do
    let(:user) { build :user, subscription_prices: subscription_prices }

    subject(:paid_subscriptions?) { user.paid_subscriptions? }

    context "when subscription prices present" do
      let(:subscription_prices) { { weekly_subscription_price: 7 } }

      it "will be truthy" do
        expect(paid_subscriptions?).to be_truthy
      end
    end

    context "when subscription prices not present" do
      let(:subscription_prices) { nil }

      it "will be falsey" do
        expect(paid_subscriptions?).to be_falsey
      end
    end
  end

  describe "#subscribed_to?" do
    let(:user) { create :user }
    let(:author) { create :user }

    subject(:subscribed_to?) { user.subscribed_to?(author) }

    context "when user subscribed to author" do
      let!(:subscription) { create :subscription, user: user, author: author }

      it "will be truthy" do
        expect(subscribed_to?).to be_truthy
      end
    end

    context "when user does not subscribed to author" do
      it "will be falsey" do
        expect(subscribed_to?).to be_falsey
      end
    end

    context "with expired subscription" do
      let!(:subscription) { create :subscription, :expired, user: user, author: author }

      it "will be falsey" do
        expect(subscribed_to?).to be_falsey
      end
    end
  end
end
