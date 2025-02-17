@MDRrun
Feature: MDR Mobile Test Automation for Profile

  @editProfile
  Scenario Outline: User perfoms Edit profile functionality
    Given User Navigate to country selection page
    Then User select country "<country>"
    Then User Navigate to Login page
    Then user enter valid credentials "<Email>" "<Password>"
    Then validate the home page
    Then User clicks menu and select service "<Service>"
    Then user click edit profile button
    Then user edit firstName "<First Name>"
    Then user edit Middle Name "<Middle Name>"
    Then user edit Last Name "<Last Name>"
    Then user edit date of birth "<dob>"
    Then user edit gender
    Then user edit blood group
    #Then user edit Emergency contact "<sos>"
    #Then user edit RelationShip "<EmergencyConatctName>" "<Relationship>"
    #Then user edit Location "<Location>"
    #Then user edit city "<City>"
    Then user user save the profile "<Save>"
		Then User clicks menu and select logout "<Logout>"
		
    Examples: 
      | country       | Email                     | Password | First Name | Middle Name | Last Name | dob      | Location|blood group | gender | Service | sos        | EmergencyConatctName |City     | Relationship |Save|Logout |
      | india         | hemavati@gmail.com | Testing@88 | Pratik     | shyam       | surve     | 04071995 | Amravati  |B+          | Male   | Profile | 1234567890 | Shambhu| Amravati | Father       |Save |Logout |
     # | United States | jhon@gmail.com | Testing@88 | Jhon    | S       | Smith     | 01121990 |Amravati| AB-          | Male   | Profile | 1234567890 | Shambhu | Amravati | Father       |Save |  Logout |
