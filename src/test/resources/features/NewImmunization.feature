@MDRNew
Feature: MDR Mobile Test Automation for Immunization

  @newimmunization
  Scenario Outline: User perfoms Immunization functionality for new app
   Given User Navigate to country selection page for new app
    Then User select country "<country>" for new app
    Then User Navigate to new app Login page
    Then user enter valid credentials "<Email>" "<Password>" for new app
    Then validate the home page for new app
    Then User clicks menu and select service "<Service>" for new app
    Then user add Immunization details "<Immunization Name>" "<Dose Number>" "<Status>" for new app
    When the user selects a date "<Immunization date>" "<Location>"for new app
   # Then user select time and location "<Location>" for new app
		Then User clicks menu and select logout "<Logout>" from new app
		
    Examples: 
      | country       | Email                     | Password | Service |Immunization Name | Dose Number |Status |Immunization date   | Location | Logout |
     | India | shivan@gmail.com | Testing@888 | Immunizations |UsCovid 200      |           1 | taken |03/02/2025     |   Gadag | Logout |
        #  | United States | jhon@gmail.com | Testing@88 | Immunization |Immunization2024        |           1 |        01/11/2024 |  Gadag | Logout |

      