@MDRrun @MDRrunUS
Feature: MDR Mobile Test Automation for Members

  @member
  Scenario Outline: User perfoms Add Members functionality
    Given User Navigate to country selection page
    Then User select country "<country>"
    Then User Navigate to Login page
    Then user enter valid credentials "<Email>" "<Password>"
    Then validate the home page
    Then User clicks menu and select service "<Service>"
    Then user click Add members button
    Then User fill details for Member firstName "<First Name>" , MiddleName "<Middle Name>" and LastName "<Last Name>"
    Then User enter Date of birth "<dob>"
    Then user select blood group "<blood group>"
    Then user select gender "<gender>"
    Then user click add member button
		Then validate the added member "<First Name>"
		Then User clicks menu and select logout "<Logout>"
    
    Examples: 
      | country       | Email                     | Password | First Name | Middle Name | Last Name | dob      | blood group | gender | Service |Logout |
      | India         | hemavati@gmail.com | Testing@88 | Akash      | t           | test      | 04071995 | B+          | Male   | members |Logout |
     # | United States | jhon@gmail.com | Testing@88 | Akash      | t           | test      | 01/11/2024 | B+          | Male   | members |Logout |
