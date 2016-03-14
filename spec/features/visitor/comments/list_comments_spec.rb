require "rails_helper"

feature "Guest user" do
  let(:article) { create :article }
  let!(:comment) { create :comment, article: article }

  before(:each) do
    visit article_path(article)
  end

  scenario "Can view comments" do
    expect(page).to have_text(comment.content)
  end
end
