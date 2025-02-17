@MDRrun
Feature: MDR Mobile Test Automation for Medication

  @medication
  Scenario Outline: User perfoms Add Medication functionality
    Given User Navigate to country selection page
    Then User select country "<country>"
    Then User Navigate to Login page
    Then user enter valid credentials "<Email>" "<Password>"
    Then validate the home page
    Then User clicks menu and select service "<Service>"
    Then user add Medicine "<Brand name>" "<Medicine Strength>"
    When the user uploads a medicine photo "<sourceOption>" "<filepath>"
    Then user select Frequency
    Then user Validate the added "<Medicine>"
    Then API Response Validation "<country>" "<Brand name>" "<Medicine Strength>"
		Then User clicks menu and select logout "<Logout>"
		
    Examples: 
      | country      | Email                     | Password |Service | Brand name |Medicine Strength |sourceOption|   filepath |  Medicine |Logout |
     | India        | hemavati@gmail.com | Testing@88 |Medication | D-cal   |200mg | Camera       | N/A     |  D-cal   |Logout |
     # | United States | jhon@gmail.com | Testing@88 | Medication | D-cal   | 100mg            | Camera       | N/A     |  D-cal   |Logout |
    # | United States | jhon@gmail.com | Testing@88 | Medication |D-cal    | 100mg| Gallery |/src/test/resources/Images/IMG_0044.jpg| D-cal |Logout |
