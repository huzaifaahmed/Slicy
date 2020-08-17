Feature: admin

  Scenario: login the account
    Given I am on the login page
    When I fill in "username_login" with "admin"
    When I fill in "password_login" with "password"
    When I press "Submit"
    Then I should see "Admin"

  Scenario: login the account and the delete option shows on pizza page
    Given I am on the login page
    When I fill in "username_login" with "admin"
    When I fill in "password_login" with "password"
    When I press "Submit"
    Given I am on the menu page
    Then I should see "Menu"
    Then I should see "Sheffield"
    Then I should see "Delete menu item by name"

  Scenario: login the account and the delete option shows on pizza page
    Given I am on the login page
    When I fill in "username_login" with "admin"
    When I fill in "password_login" with "password"
    When I press "Submit"
    Given I am on the menu page
    Then I should see "Menu"
    When I select "London" from "location"
    When I press "Apply"
    Then I should see "London"
    Then I should see "Delete menu item by name"

  Scenario: login the account and the delete option shows on sides page
    Given I am on the login page
    When I fill in "username_login" with "admin"
    When I fill in "password_login" with "password"
    When I press "Submit"
    Given I am on the menu page
    Then I should see "Menu"
    When I press "Sides"
    Then I should see "Sheffield"
    Then I should see "Delete menu item by name"

  Scenario: login the account and the delete option shows on sides menu
    Given I am on the login page
    When I fill in "username_login" with "admin"
    When I fill in "password_login" with "password"
    When I press "Submit"
    Given I am on the menu page
    Then I should see "Menu"
    When I press "Sides"
    When I select "London" from "location"
    When I press "Apply"
    Then I should see "London"
    Then I should see "Delete menu item by name"

  Scenario: login the account and the delete option shows on dessert menu
    Given I am on the login page
    When I fill in "username_login" with "admin"
    When I fill in "password_login" with "password"
    When I press "Submit"
    Given I am on the menu page
    Then I should see "Menu"
    When I press "Desserts"
    Then I should see "Sheffield"
    Then I should see "Delete menu item by name"

  Scenario: login the account and the delete option shows on dessert menu
    Given I am on the login page
    When I fill in "username_login" with "admin"
    When I fill in "password_login" with "password"
    When I press "Submit"
    Given I am on the menu page
    Then I should see "Menu"
    When I press "Sides"
    When I select "London" from "location"
    When I press "Apply"
    Then I should see "London"
    Then I should see "Delete menu item by name"

  Scenario: login the account and the delete option shows on drink menu
    Given I am on the login page
    When I fill in "username_login" with "admin"
    When I fill in "password_login" with "password"
    When I press "Submit"
    Given I am on the menu page
    Then I should see "Menu"
    When I press "Drinks"
    Then I should see "Sheffield"
    Then I should see "Delete menu item by name"

  Scenario: login the account and the delete option shows on drink menu
    Given I am on the login page
    When I fill in "username_login" with "admin"
    When I fill in "password_login" with "password"
    When I press "Submit"
    Given I am on the menu page
    Then I should see "Menu"
    When I press "Drinks"
    When I select "London" from "location"
    When I press "Apply"
    Then I should see "London"
    Then I should see "Delete menu item by name"
