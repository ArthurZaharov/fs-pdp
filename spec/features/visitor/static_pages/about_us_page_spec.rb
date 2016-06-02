require "rails_helper"

feature "About Us page (visitor)" do
  scenario "Visitor views the about us page" do
    visit "/about_us"

    expect(page).to have_text("About Us")
  end
end
