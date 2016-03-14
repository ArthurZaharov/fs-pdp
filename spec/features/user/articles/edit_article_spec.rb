require "rails_helper"

feature "Edit articles" do
  include_context "current user signed in"

  let!(:article) { create :article, user: current_user }

  before(:each) do
    visit edit_article_path(article)
  end

  scenario "User creates article" do
    fill_form(:article, title: "New title")
    click_button("Update Article")

    expect(page).to have_content("Article was successfully updated.")
    expect(article.reload.title).to eq("New title")
  end
end
