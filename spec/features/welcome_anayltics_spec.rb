require "rails_helper"

RSpec.feature "Welcome Analytics" do
  # In order to be understood
  # As a visitor
  # I want to be helpful with future developments

  scenario "Collecting Welcome Page Views", :js do
    # Given I have a Google Analytics tracker

    # When I go to the homepage
    visit root_path

    # Then I should have a tracking script
    expect_page_to_have_tracking_script
  end

  scenario "Collecting clicks on the Pig", :js do
    # Given I have a Google Analytics tracker

    # When I go to the homepage
    visit root_path

    # And I click on the Pig
    find("#spiderpig img").click

    # Then I should fire a welcome:clickedPig tracking event
    expect_tracking_event("welcome", "clickedPig")

    # And I should see and hear the Raptor
    expect(page).to have_selector(".raptor")
    expect(page).to have_selector("audio", visible: :hidden)
  end
end
