require "rails_helper"

feature "List articles (visitor)" do
  let!(:articles) { create_list :article, 3 }
  let!(:paid_article) { create :article, :paid }

  before do
    visit root_path
  end

  scenario "Visitor views the list of articles" do
    articles.each do |article|
      expect(page).to have_link(article.title, href: article_path(article))
      expect(page).to have_text(article.content)
    end

    expect(page).not_to have_link(paid_article.title, href: article_path(paid_article))
    expect(page).to have_text(paid_article.title)
    expect(page).to have_text(paid_article.content)
  end
end
