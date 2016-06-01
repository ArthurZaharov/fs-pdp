require "rails_helper"

feature "Create articles" do
  include_context "current user signed in"

  before(:each) do
    visit new_user_article_path
  end

  scenario "User creates article" do
    fill_form(:article, attributes_for(:article))
    click_button("Create Article")

    expect(page).to have_content("Article was successfully created.")
  end
end
