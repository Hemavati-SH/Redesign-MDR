@MDRrun
Feature: MDR Mobile Test Automation for Immunization

  @immunization
  Scenario Outline: User perfoms Immunization functionality
    Given User Navigate to country selection page
    Then User select country "<country>"
    Then User Navigate to Login page
    Then user enter valid credentials "<Email>" "<Password>"
    Then validate the home page
    Then User clicks menu and select service "<Service>"
    Then user add Immunization details "<Immunization Name>" "<Dose Number>" 
    When the user selects a date "<Immunization date>"
    Then user select time and location "<Location>" 
		Then User clicks menu and select logout "<Logout>"
		
    Examples: 
      | country       | Email                     | Password | Service |Immunization Name | Dose Number |Immunization date   | Location | Logout |
     | india         | hemavati@gmail.com | Testing@88 | Immunization |UsCovid 199       |           2 | 15/10/2024     |   Gadag | Logout |
        #  | United States | jhon@gmail.com | Testing@88 | Immunization |Immunization2024        |           1 |        01/11/2024 |  Gadag | Logout |

      