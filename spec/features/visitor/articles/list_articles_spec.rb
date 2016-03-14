require "rails_helper"

feature "List articles (visitor)" do
  let!(:articles) { create_list :article, 3 }

  before(:each) do
    visit root_path
  end

  scenario "Visitor views the list of articles" do
    articles.each do |article|
      expect(page).to have_link(article.title, href: article_path(article))
      expect(page).to have_text(article.content)
    end
  end
end
