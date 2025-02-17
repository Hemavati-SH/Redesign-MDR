@MDRrun
Feature: MDR Mobile Test Automation for Immunization

  @healthsnapshotvital
  Scenario Outline: User perfoms Health Snapshot vital functionality
    Given User Navigate to country selection page
    Then User select country "<country>"
    Then User Navigate to Login page
    Then user enter valid credentials "<Email>" "<Password>"
    Then validate the home page
    Then User clicks menu and select service "<Service>"
    Then User click on "<Vital>" and add the value of the vital <Value> and validates
    Then validate added vital "<Vital>" and <Value>
   	Then User clicks menu and select logout "<Logout>"
    
 Examples:   
| country       | Email                     | Password | Service  | Vital | Value|   Logout |  
#| United States |jhon@gmail.com | Testing@88 | Health Snapshot | Bmi | 10 | Logout |
| india         | hemavati@gmail.com | Testing@88 | Health Snapshot| Bmi | 10 |  Logout |


@healthsnapshotcategory
Scenario Outline: User perfoms Health Snapshot category functionality
    Given User Navigate to country selection page
    Then User select country "<country>"
    Then User Navigate to Login page
    Then user enter valid credentials "<Email>" "<Password>"
    Then validate the home page
    Then User clicks menu and select service "<Service>"
    Then User Selects Category "<Category>"
    Then User clicks menu and select logout "<Logout>"
    
 Examples:   
| country       | Email                     | Password | Service  | Category |  Logout |  
#| United States |jhon@gmail.com | Testing@88 | Health Snapshot | allergy | Logout |
| india         | hemavati@gmail.com | Testing@88 | Health Snapshot|   allergy | Logout |