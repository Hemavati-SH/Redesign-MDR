@MDRNew
Feature: MDR Mobile Test Automation for Medication

  @newmedication
  Scenario Outline: User perfoms Add Medication functionality
    Given User Navigate to country selection page for new app
    Then User select country "<country>" for new app
    Then User Navigate to new app Login page
    Then user enter valid credentials "<Email>" "<Password>" for new app
    Then validate the home page for new app
    Then User clicks menu and select service "<Service>" for new app
    Then user add Medicine "<Brand name>" "<Medicine Strength>" for new app
    When the user uploads a medicine photo "<sourceOption>" "<filepath>" for new app
    Then user select Frequency for new app
   # Then user Validate the added "<Medicine>" for new app
	Then User clicks menu and select logout "<Logout>" from new app
		
    Examples: 
      | country      | Email                     | Password |Service | Brand name |Medicine Strength |sourceOption|   filepath |  Medicine |Logout |
     | India | shivan@gmail.com | Testing@888 |Medication | Paracetmol   |200mg | Camera       | N/A     |  Paracetmol   |Logout |
     # | United States | jhon@gmail.com | Testing@88 | Medication | D-cal   | 100mg            | Camera       | N/A     |  D-cal   |Logout |
    # | United States | jhon@gmail.com | Testing@88 | Medication |D-cal    | 100mg| Gallery |/src/test/resources/Images/IMG_0044.jpg| D-cal |Logout |
