require "rails_helper"

describe UserPolicy do
  let(:current_user) { build :user }

  subject { described_class }

  permissions :subscribe? do
    context "when author has not subscription prices" do
      let(:author) { build :user, subscription_prices: nil }

      it "denies subscribe to author" do
        expect(subject).not_to permit(current_user, author)
      end
    end

    context "when author is current user" do
      let(:author) { current_user }

      it "denies subscribe to author" do
        expect(subject).not_to permit(current_user, author)
      end
    end

    context "when author has subscription prices" do
      let(:subscription_prices) { { weekly_subscription_price: 7 } }
      let(:author) { build :user, subscription_prices: subscription_prices }

      it "allows subscribe to author" do
        expect(subject).to permit(current_user, author)
      end
    end
  end
end
