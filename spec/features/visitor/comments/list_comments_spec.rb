require "rails_helper"

feature "List comments (visitor)" do
  let(:article) { create :article }
  let!(:comment) { create :comment, article: article }

  before do
    visit article_path(article)
  end

  scenario "Visitor views the article comments" do
    expect(page).to have_text(comment.content)
  end
end
