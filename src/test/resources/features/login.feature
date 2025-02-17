@MDRrun1 @MDRrunUS
Feature: MDR Mobile Test Automation for login

  @login
  Scenario Outline: User perfoms login functionality
    Given User Navigate to country selection page
    Then User select country "<country>"
    Then User Navigate to Login page
    Then user enter valid credentials "<Email>" "<Password>"
    Then validate the home page
		Then User clicks menu and select logout "<Logout>"
		
    Examples: 
      | country       | Email                   | Password |Logout |
     # |  United States  | jhon@gmail.com | Testing@88 |Logout |
   		| India | hemavati@gmail.com | Testing@88 | Logout |