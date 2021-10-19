require "rails_helper"

RSpec.describe "home" do
  scenario "have navbar element" do
    visit root_url

    expect(page).to have_css "nav.navbar"
  end
end