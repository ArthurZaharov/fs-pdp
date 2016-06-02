require "rails_helper"

feature "Show article (visitor)" do
  let!(:article) { create :article }

  before do
    visit article_path(article)
  end

  scenario "Visitor views the article" do
    expect(page).to have_text(article.title)
    expect(page).to have_text(article.content)
  end
end
