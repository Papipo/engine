Feature: Catch-all route
  As a rails developer
  In order to be able to use other engines
  I want the catch-all route from locomotive be the last one
  
  Background:
    Given I have the site: "test site" set up
  
  Scenario: Getting a route from another engine
    When I go to an engine page
    Then I should see "PLACEHOLDER"
    
  Scenario: Catch-all from locomotive
    When I go to an invented path
    Then I should see "Content of the 404 page"