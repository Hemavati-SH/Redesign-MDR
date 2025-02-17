@SignUpSuite
Feature: MDR Mobile Test Automation for SignUp

  @signUp
  Scenario Outline: User perfoms login functionality
    Given User Navigate to country selection page
    Then User select country "<country>"
    Then User Navigate to Login page
    Then user clicks on signUp
    Then User select country code and enter Phone number "<Phone Number>"
    Then User Enter firstName "<First Name>" , MiddleName "<Middle Name>" and LastName "<Last Name>"
    Then user Enter Email "<Email>"
    Then User Enter Date of Birth "<DOB>"
    Then User Enter password "<Password>" and Confirm Password "<ConfirmPassword>"
    Then User click iAgree and contine button
		Then User clicks menu and select logout "<Logout>"
		
    Examples: 
      |country| Email                     | Password | ConfirmPassword | Phone Number | First Name | Middle Name | Last Name | DOB  |Logout |
    #  |india  | hemavati@gmail.com | Test@123 | Test@123        |  8722821474 | Hemavati     | M    | Balishettar | 27031988 |Logout |
