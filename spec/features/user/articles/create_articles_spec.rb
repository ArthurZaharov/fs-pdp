require "rails_helper"

feature "Signed in user" do
  include_context "current user signed in"

  background do
    visit new_article_path
  end

  scenario "can create article with valid data" do
    expect { new_article_page.create }.to change { Article.count }.by(1)
  end

  scenario "can not create article with invalid data" do
    fill_in("title", with: "")
    expect(page).to have_validation_error_alert
  end

  scenario "has create new article link" do
    expect(new_article_page.top_bar).to have_create_new_article_link
  end

  scenario "redirected to articles path after create article with successful notice" do
    new_article_page.create
    expect(articles_page).to have_create_successful_notice
  end
end
