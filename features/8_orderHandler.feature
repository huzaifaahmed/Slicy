Feature: order handler page

  Scenario: correct order handler page
    Given I am on the login page
    When I fill in "username_login" with "order handler"
    When I fill in "password_login" with "password"
    When I press "Submit"
    Given I am on the order handler page
    Then I should see "Order"

  Scenario: correct order handler page
    Given I am on the login page
    When I fill in "username_login" with "order handler"
    When I fill in "password_login" with "password"
    When I press "Submit"
    Given I am on the twitter page
    Then I should see "Customer Twitter Search"
