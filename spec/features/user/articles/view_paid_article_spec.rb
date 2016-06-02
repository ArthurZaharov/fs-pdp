require "rails_helper"

feature "View paid article when subscribed to author" do
  include_context "current user signed in"

  let(:author) { create :user }
  let!(:author_article) { create :article, :paid, user: author }
  let(:other_author) { create :user }
  let!(:other_article) { create :article, :paid, user: other_author }
  let!(:subscription) { create :subscription, user: current_user, author: author }

  before do
    visit root_path
  end

  scenario "User views list of paid articles" do
    expect(page).to have_link(author_article.title)
    expect(page).not_to have_link(other_article.title)
    expect(page).to have_text(other_article.title)
  end

  scenario "User view paid article when he subscribed to author" do
    click_link author_article.title

    expect(page).to have_content(author_article.title)
    expect(page).to have_content(author_article.content)
  end
end
