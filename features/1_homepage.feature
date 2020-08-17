Feature: Homepage

  Scenario: Proper Loading of Page
    Given I am on the home page
    Then I should see "Homepage"
    Then I should see "Menu"
    Then I should see "Register"
    Then I should see "Login"
    Then I should see "Pizza Shed"

  Scenario: Proper Loading of Page
    Given I am on the home page
    When I follow "Menu"
    Then I should see "Menu"
    When I follow "Register"
    Then I should see "Register"
    When I follow "Login"
    Then I should see "Login"
