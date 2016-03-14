require "rails_helper"

feature "Create comments" do
  include_context "current user signed in"

  let!(:article) { create :article }
  let(:comment_content) { "New comment content" }

  before(:each) do
    visit article_path(article)
  end

  scenario "User creates comment", js: true do
    fill_form(:comment, content: comment_content)
    click_button("Create Comment")

    expect(page).to have_content(current_user.full_name)
    expect(page).to have_content(comment_content)
  end
end
