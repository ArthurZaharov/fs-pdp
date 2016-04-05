require "rails_helper"

feature "Show author page (visitor)" do
  let!(:author) { create :user }
  let!(:author_article) { create :article, user: author }
  let!(:other_article) { create :article }

  before(:each) do
    visit author_path(author)
  end

  scenario "Visitor views the authors page" do
    expect(page).to have_text(author.full_name)
    expect(page).to have_text(author_article.title)
    expect(page).to have_text(author_article.content)
    expect(page).not_to have_text(other_article.title)
    expect(page).not_to have_text(other_article.content)
  end
end
