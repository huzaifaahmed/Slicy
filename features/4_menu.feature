Feature: register

  Scenario: Correct Sheffield pizza menu
    Given I am on the menu page
    Then I should see "Menu"
    When I press "Apply"
    Then I should see "Sheffield"
    Then I should see "Margarita"

  Scenario: Correct London pizza menu
    Given I am on the menu page
    Then I should see "Menu"
    When I select "London" from "location"
    When I press "Apply"
    Then I should see "London"
    Then I should see "Pesto"

  Scenario: Correct Sheffield sides menu
    Given I am on the menu page
    Then I should see "Menu"
    When I press "Apply"
    When I press "Sides"
    Then I should see "Sheffield"
    Then I should see "Garlic Bread"

  Scenario: Correct London sides menu
    Given I am on the menu page
    Then I should see "Menu"
    When I press "Sides"
    When I select "London" from "location"
    When I press "Apply"
    Then I should see "London"
    Then I should see "Cheesy garlic bread"

  Scenario: Correct Sheffield desserts menu
    Given I am on the menu page
    Then I should see "Menu"
    When I press "Apply"
    When I press "Desserts"
    Then I should see "Sheffield"
    Then I should see "Ben and Jerrys Fish food"

  Scenario: Correct London desserts menu
    Given I am on the menu page
    Then I should see "Menu"
    When I press "Desserts"
    When I select "London" from "location"
    When I press "Apply"
    Then I should see "London"
    Then I should see "Apple pie"

  Scenario: Correct Sheffield drink menu
    Given I am on the menu page
    Then I should see "Menu"
    When I press "Apply"
    When I press "Drinks"
    Then I should see "Sheffield"
    Then I should see "Coca-cola"

  Scenario: Correct London drink menu
    Given I am on the menu page
    Then I should see "Menu"
    When I press "Drinks"
    When I select "London" from "location"
    When I press "Apply"
    Then I should see "London"
    Then I should see "Sparkling water"
