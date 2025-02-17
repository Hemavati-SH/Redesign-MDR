@MDRrun
Feature: MDR Mobile Test Automation for Support

  @support
  Scenario Outline: User perfoms Support functionality
    Given User Navigate to country selection page
    Then User select country "<country>"
    Then User Navigate to Login page
    Then user enter valid credentials "<Email>" "<Password>"
    Then validate the home page
    Then User clicks menu and select service "<Service>"
    Then User clicks email subject and note "<EmailSupport>" "<Subject>" "<Note>"
    Then User clicks on submit
		Then User clicks menu and select logout "<Logout>"

		Examples: 
      | country       | Email                     | Password | Service| EmailSupport | Subject | Note | Logout |
     | india         | hemavati@gmail.com | Testing@88 | Support | bmhema4567@gmail.com  |Regular Health Updates | Here is your health updates | Logout |
    #  | United States | jhon@gmail.com | Testing@88 | Support| bmhema4567@gmail.com  |Regular Health Updates | Here is your health updates | Logout |
		