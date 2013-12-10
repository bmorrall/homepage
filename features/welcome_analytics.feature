Feature: Display Welcome
  In order to be understood
  As a visitor
  I want to be helpful with future developments

@javascript
Scenario: Collecting Welcome Page Views
  Given I have a Google Analytics tracker
  When I go to the homepage
  Then I should have a tracking script

@javascript
Scenario: Collecting clicks on the Pig
  Given I have a Google Analytics tracker
  When I go to the homepage
  And I click on the Pig
  Then I should fire a welcome:clickedPig tracking event
  And I should see and hear the Raptor
