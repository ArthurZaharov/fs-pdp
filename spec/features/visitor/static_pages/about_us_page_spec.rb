require "rails_helper"

feature "About Us page (visitor)" do
  before(:each) do
    visit "/about_us"
  end

  scenario "Visitor views the about us page" do
    expect(page).to have_text("About Us")
  end
end
