require "rails_helper"

feature "Show Article" do
  let!(:article) { create :article }

  before(:each) do
    visit article_path(article)
  end

  scenario "Can view article" do
    expect(page).to have_text(article.title)
    expect(page).to have_text(article.content)
  end
end
