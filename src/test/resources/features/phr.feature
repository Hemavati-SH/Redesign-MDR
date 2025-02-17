@MDRrun
Feature: MDR Mobile Test Automation for PHR

  @phr
  Scenario Outline: User perfoms PHR functionality
    Given User Navigate to country selection page
    Then User select country "<country>"
    Then User Navigate to Login page
    Then user enter valid credentials "<Email>" "<Password>"
    Then validate the home page
    Then User clicks menu and select service "<Service>"
    Then User enters the date and time and clicks on checkbox
    Then User clicks on grant consent
		Then User clicks menu and select logout "<Logout>"

		Examples: 
      | country       | Email                     | Password | Service|  Logout |
     | india         | hemavati@gmail.com | Testing@88 | Phr|  Logout |
     # | United States | jhon@gmail.com | Testing@88 | Phr|  Logout |
		