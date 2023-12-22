require "rails_helper"

RSpec.feature "Display Welcome" do
  # In order to abate my curiosity
  # As a visitor
  # I want to get the full benmorrall.com experience

  scenario "Visit Welcome to see the Pig", :js do
    # When I go to the homepage
    visit root_path

    # Then I should see the Pig
    expect(page).to have_selector("body.welcome #content")
    expect(page).to have_selector("#spiderpig img")
  end

  scenario "Clicking on the Pig", :js do
    # When I go to the homepage
    visit root_path

    # And I click on the Pig
    find("#spiderpig img").click

    # Then I should see and hear the Raptor
    expect(page).to have_selector(".raptor")
    expect(page).to have_selector("audio", visible: :hidden)
  end
end
