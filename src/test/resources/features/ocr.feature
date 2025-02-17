@MDRrun
Feature: MDR Mobile Test Automation for OCR

  @OCRmed
  Scenario Outline: User perfoms login functionality
    Given User Navigate to country selection page
    Then User select country "<country>"
    Then User Navigate to Login page
    Then user enter valid credentials "<Email>" "<Password>"
    Then validate the home page
    Then user click OCR and select medicince and scann medicine "<Photopath>"
    Then user add medicine and medicine Strenght "<Strenght>"
    Then user select Frequency "<Strenght>"
  	Then User clicks menu and select logout "<Logout>"

    Examples: 
      | country | Email                     | Password | Photopath                                 | Strenght |Logout |
   #   | United States   | jhon@gmail.com | Testing@88 | \\src\\test\\resources\\Images\\pres2.jpg | 1MG      |Logout |
