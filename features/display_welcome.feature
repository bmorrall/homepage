Feature: Display Welcome
  In order to abate my curiosity
  As a visitor
  I want to get the full benmorrall.com experience

Scenario: Visit Welcome to see the Pig
  When I go to the homepage
  Then I should see the Pig

@javascript
Scenario: Clicking on the Pig
  When I go to the homepage
  And I click on the pig
  Then I should see and hear the Raptor
