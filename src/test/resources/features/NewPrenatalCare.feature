@MDRNew
Feature: MDR Mobile Test Automation for Prenatal Care

  @newaddappointment
  Scenario Outline: User perfoms add appointment for Prenatal care functionality
    Given User Navigate to country selection page for new app
    Then User select country "<country>" for new app
    Then User Navigate to new app Login page
    Then user enter valid credentials "<Email>" "<Password>" for new app
    Then validate the home page for new app
    Then User clicks menu and select service "<Service>" for new app
    Then user continue for prenatal care service for new app
    Then user add apointment "<AppointmentFor>" "<Doctor>" "<note>" for new app
	Then User clicks menu and select logout "<Logout>" from new app
		
    Examples: 
      | country       | Email                     | Password | Service       | AppointmentFor  | Doctor  |note |Logout |
      | India | shivan@gmail.com | Testing@888| Prenatalcare | Genral Check-up | Dr.batra| Keep Healthy |Logout |
     # | United States | jhon@gmail.com | Testing@88 | Prenatal care | Genral Check-up | Dr.batra |Logout |

  @newarticle
  Scenario Outline: User perfoms Article checkout for Prenatal care functionality
    Given User Navigate to country selection page for new app
    Then User select country "<country>" for new app
    Then User Navigate to new app Login page
    Then user enter valid credentials "<Email>" "<Password>" for new app
    Then validate the home page for new app
    Then User clicks menu and select service "<Service>" for new app
    Then user continue for prenatal care service for new app
    Then user checkout Article for new app
	Then User clicks menu and select logout "<Logout>" from new app
		
    Examples: 
      | country       | Email                     | Password | Service       |logout |
     | India | shivan@gmail.com | Testing@888 | Prenatal care |logout |
      # | United States |jhon@gmail.com | Testing@88 | Prenatal care |logout |

  @newaddJournal
  Scenario Outline: User perfoms add Journal for Prenatal care functionality
   Given User Navigate to country selection page for new app
    Then User select country "<country>" for new app
    Then User Navigate to new app Login page
    Then user enter valid credentials "<Email>" "<Password>" for new app
    Then validate the home page for new app
    Then User clicks menu and select service "<Service>" for new app
    Then user continue for prenatal care service for new app
    Then user add todays feelings in journal "<Title>" "<Description>" for new app
	Then User clicks menu and select logout "<Logout>" from new app
		
    Examples: 
      | country       | Email                     | Password | Service       | Title | Description |Logout |
    | India | shivan@gmail.com | Testing@888 | Prenatal care | happy | happy       |Logout |
     #  | United States | jhon@gmail.com | Testing@88 | Prenatal care | happy | happy       |Logout |

  @newPenatalcareMedicine
  Scenario Outline: User perfoms Add Medication for prenatal care functionality
    Given User Navigate to country selection page for new app
    Then User select country "<country>" for new app
    Then User Navigate to new app Login page
    Then user enter valid credentials "<Email>" "<Password>" for new app
    Then validate the home page for new app
    Then User clicks menu and select service "<Service>" for new app
    Then user continue for prenatal care service for new app
   # Then user click Medicine button for new app
    Then user clheckout Medicine for new app
		Then User clicks menu and select logout "<Logout>" from new app
		
    Examples: 
      | country       | Email                     | Password | Service       |Logout |
     | India | shivan@gmail.com | Testing@888 | Prenatal care |Logout |
     #  | United States | jhon@gmail.com | Testing@88 | Prenatal care |Logout |
     
  @NewPrenatalCareCompleteFlow   
  Scenario Outline: User perfoms Add Medication for prenatal care functionality
    Given User Navigate to country selection page for new app
    Then User select country "<country>" for new app
    Then User Navigate to new app Login page
    Then user enter valid credentials "<Email>" "<Password>" for new app
    Then validate the home page for new app
    Then User clicks menu and select service "<Service>" for new app
    Then user continue for prenatal care service for new app
    Then user add apointment "<AppointmentFor>" "<Doctor>" "<note>" for new app
    Then user add todays feelings in journal "<Title>" "<Description>" for new app
    Then user checkout Article for new app
   # Then user click Medicine button for new app
    Then user clheckout Medicine for new app
		#Then User clicks menu and select logout "<Logout>" from new app   
		
 Examples: 		
 | country       | Email                     | Password | Service  |AppointmentFor  | Doctor  |note | Title | Description | Logout |
 | India | shivan@gmail.com | Testing@888 | Prenatal care |Genral Check-up | Dr.batra| Keep Healthy |happy | happy     | Logout |
		