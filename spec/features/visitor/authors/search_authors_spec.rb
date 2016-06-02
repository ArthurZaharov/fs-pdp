require "rails_helper"

feature "Search author by article content", :vcr do
  let(:author) { create :user }
  let!(:author_article) { create :article, user: author, content: "Awesome content" }
  let(:other_author) { create :user }
  let!(:other_article) { create :article, user: other_author, content: "Simple content" }

  before do
    visit root_path
  end

  scenario "Visitor search authors by articles content", js: true do
  end
end
