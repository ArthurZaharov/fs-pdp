require "rails_helper"

feature "List Articles" do
  let!(:articles) { create_list :article, 3 }

  before(:each) do
    visit root_path
  end

  scenario "Can view list of articles" do
    articles.each do |article|
      expect(page).to have_link(article.title, href: article_path(article))
      expect(page).to have_text(article.content)
    end
  end
end
