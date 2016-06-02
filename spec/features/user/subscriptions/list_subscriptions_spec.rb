require "rails_helper"

feature "List subscriptions" do
  include_context "current user signed in"

  let(:author) { create :user }
  let!(:subscription) { create :subscription, user: current_user, author: author }

  scenario "User signs out" do
    visit user_subscriptions_path

    expect(page).to have_content(author.full_name)
    expect(page).to have_content(subscription.expired_at)
  end
end
