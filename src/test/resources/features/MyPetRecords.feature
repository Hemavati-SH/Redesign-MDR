@MDRrun
Feature: MDR Mobile Test Automation for MyPetRecords

  @Mypetrecords
  Scenario Outline: User perfoms Support functionality
    Given User Navigate to country selection page
    Then User select country "<country>"
    Then User Navigate to Login page
    Then user enter valid credentials "<Email>" "<Password>"
    Then validate the home page
    Then User clicks menu and select service "<Service>"
		#Then User clicks menu and select logout "<Logout>"

		Examples: 
      | country       | Email                     | Password | Service | Logout |
     | india         | hemavati@gmail.com | Testing@88 | MyPetRecords |   Logout |
    #  | United States | jhon@gmail.com | Testing@88 | MyPetRecords |   Logout |
		
