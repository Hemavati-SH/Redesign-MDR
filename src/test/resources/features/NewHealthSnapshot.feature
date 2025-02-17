@MDRNew
Feature: MDR Mobile Test Automation for Immunization

  @newhealthsnapshotvital
  Scenario Outline: User perfoms Health Snapshot vital functionality
    Given User Navigate to country selection page for new app
    Then User select country "<country>" for new app
    Then User Navigate to new app Login page
    Then user enter valid credentials "<Email>" "<Password>" for new app
    Then validate the home page for new app
    Then User clicks menu and select service "<Service>" for new app
    Then User click on "<Vital>" and add the value of the vital <Value> and validates for new app
    Then validate added vital "<Vital>" and <Value> for new app
   Then User clicks menu and select logout "<Logout>" from new app
    
 Examples:   
| country       | Email                     | Password | Service  | Vital | Value|   Logout |  
#| United States |jhon@gmail.com | Testing@88 | HealthSnapshot | Heart rate | 99 | Logout |
| India | shivan@gmail.com | Testing@888 | HealthSnapshot| Heart rate | 99 |  Logout |


@newhealthsnapshotcategory
Scenario Outline: User perfoms Health Snapshot category functionality
    Given User Navigate to country selection page for new app
    Then User select country "<country>" for new app
    Then User Navigate to new app Login page
    Then user enter valid credentials "<Email>" "<Password>" for new app
    Then validate the home page for new app
    Then User clicks menu and select service "<Service>" for new app
    Then User Selects Category "<Category>" for new app
   Then User clicks menu and select logout "<Logout>" from new app
    
 Examples:   
| country       | Email                     | Password | Service  | Category |  Logout |  
#| United States |jhon@gmail.com | Testing@88 | Health Snapshot | allergy | Logout |
| India | shivan@gmail.com | Testing@888 | Health Snapshot|   allergy | Logout |