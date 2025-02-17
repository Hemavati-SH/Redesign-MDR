Feature: MDR Mobile Test Automation for login

  @mdrlogin
  Scenario Outline: User performs login functionality
    Given User Navigate to country selection page
    Then User select country "<country>"
    Then User Navigate to Login page
    Then user enter valid credentials "<Email>" "<Password>"
    Then validate the API response for login
    Then validate the home page
    Then User clicks menu and selects logout "<Logout>"

    Examples: 
      | country       | Email                   | Password  | Logout |
      | India         | hemavati@gmail.com      | Testing@88 | Logout |
