@MDRNew
Feature: Mobile Test Automation for Health Hub

  @newHealthhub
  Scenario Outline: User perfoms Health Hub functionality
     Given User Navigate to country selection page for new app
    Then User select country "<country>" for new app
    Then User Navigate to new app Login page
    Then user enter valid credentials "<Email>" "<Password>" for new app
    Then validate the home page for new app
    Then User clicks menu and select service "<Service>" for new app
    Then User clicks on Continue for new app
    When user select random options and click continue for new app
		Then User clicks menu and select logout "<Logout>" from new app

		Examples: 
      | country       | Email                     | Password | Service | Logout |
    | India | shivan@gmail.com | Testing@888  | Health Hub |   Logout |
      #| United States | jhon@gmail.com | Testing@88 | Education |   Logout |
		
