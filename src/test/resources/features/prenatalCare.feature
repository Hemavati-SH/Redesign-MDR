@MDRrun @MDRrunUS
Feature: MDR Mobile Test Automation for Prenatal Care

  @addappointment
  Scenario Outline: User perfoms add appointment for Prenatal care functionality
    Given User Navigate to country selection page
    Then User select country "<country>"
    Then User Navigate to Login page
    Then user enter valid credentials "<Email>" "<Password>"
    Then validate the home page
    Then User clicks menu and select service "<Service>"
    Then user continue for prenatal care service
    Then user add apointment "<AppointmentFor>" "<Doctor>"
		Then User clicks menu and select logout "<Logout>"
		
    Examples: 
      | country       | Email                     | Password | Service       | AppointmentFor  | Doctor   |Logout |
      | india         |  hemavati@gmail.com | Testing@88 | Prenatal care | Genral Check-up | Dr.batra |Logout |
     # | United States | jhon@gmail.com | Testing@88 | Prenatal care | Genral Check-up | Dr.batra |Logout |

  @article
  Scenario Outline: User perfoms Article checkout for Prenatal care functionality
    Given User Navigate to country selection page
   # Then User select country "<country>"
  #  Then User Navigate to Login page
    Then user enter valid credentials "<Email>" "<Password>"
    Then validate the home page
    Then User clicks menu and select service "<Service>"
    Then user continue for prenatal care service
    Then user checkout Article
		Then User clicks menu and select logout "<Logout>"
		
    Examples: 
      | country       | Email                     | Password | Service       |logout |
     | india   | hemavati@gmail.com | Testing@88 | Prenatal care |logout |
      # | United States |jhon@gmail.com | Testing@88 | Prenatal care |logout |

  @addJournal
  Scenario Outline: User perfoms add Journal for Prenatal care functionality
    Given User Navigate to country selection page
    Then User select country "<country>"
    Then User Navigate to Login page
    Then user enter valid credentials "<Email>" "<Password>"
    Then validate the home page
    Then User clicks menu and select service "<Service>"
    Then user continue for prenatal care service
    Then user add todays feelings in journal "<Title>" "<Description>"
		Then User clicks menu and select logout "<Logout>"
		
    Examples: 
      | country       | Email                     | Password | Service       | Title | Description |Logout |
     | india   | hemavati@gmail.com | Testing@88 | Prenatal care | happy | happy       |Logout |
     #  | United States | jhon@gmail.com | Testing@88 | Prenatal care | happy | happy       |Logout |

  @PenatalcareMedicine
  Scenario Outline: User perfoms Add Medication for prenatal care functionality
    Given User Navigate to country selection page
    Then User select country "<country>"
    Then User Navigate to Login page
    Then user enter valid credentials "<Email>" "<Password>"
    Then validate the home page
    Then User clicks menu and select service "<Service>"
    Then user continue for prenatal care service
   # Then user click Medicine button
    Then user clheckout Medicine
		Then User clicks menu and select logout "<Logout>"
		
    Examples: 
      | country       | Email                     | Password | Service       |Logout |
     | india   | hemavati@gmail.com | Testing@88 | Prenatal care |Logout |
     #  | United States | jhon@gmail.com | Testing@88 | Prenatal care |Logout |
