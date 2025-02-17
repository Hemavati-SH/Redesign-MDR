@MDRrun @MDRrunUS
Feature: MDR Mobile Test Automation for Pharmacy

  @Pharmacy
  Scenario Outline: User perfoms Pharmacy functionality
    Given User Navigate to country selection page
    Then User select country "<country>"
    Then User Navigate to Login page
    Then user enter valid credentials "<Email>" "<Password>"
    Then validate the home page
    Then User clicks menu and select service "<Service>"
    Then user select Pharmacy "<Pharmacy>" service and validate
    Then User clicks menu and select logout "<Logout>"

    Examples: 
      | country       | Email                     | Password | Service| Pharmacy | Logout |
    | india         | hemavati@gmail.com | Testing@88 | Pharmacy | 1mg      | Logout |
      # | United States | jhon@gmail.com | Testing@88 | Pharmacy| Rite Aid      | Logout |
