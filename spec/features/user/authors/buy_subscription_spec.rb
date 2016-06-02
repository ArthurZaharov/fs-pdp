require "rails_helper"

feature "User buy subscription to author" do
  include_context "current user signed in"

  let(:author) { create :user, subscription_prices: subscription_prices }
  let(:subscription_prices) { { weekly_subscription_price: 7 } }
  let!(:article) { create :article, :paid, user: author }

  before do
    visit author_path(author)
  end

  scenario "User cannot view paid article before subscribe to author" do
    expect(page).not_to have_link(article.title)
    expect(page).to have_text(article.title)
  end

  scenario "User can view paid article after subscribe to author", js: true do
  end
end
