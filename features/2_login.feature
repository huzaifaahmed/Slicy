Feature: login

  Scenario: Correct page
    Given I am on the login page
    Then I should see "Login"

  Scenario: Correct password entered
    Given I am on the login page
    When I fill in "username_login" with "cotcher"
    When I fill in "password_login" with "password"
    When I press "Submit"
    Then I should see "Pizza Shed"

  Scenario: Logout displayed when logged in
    Given I am on the login page
    When I fill in "username_login" with "cotcher"
    When I fill in "password_login" with "password"
    When I press "Submit"
    Then I should see "Sign Out"

  Scenario: 'Sign out' displayed when logged in
    Given I am on the login page
    Then I should not see "Sign Out"

  Scenario: Wrong password entered
    Given I am on the login page
    When I fill in "username_login" with "cotcher"
    When I fill in "password_login" with "nonsense"
    When I press "Submit"
    Then I should see "Incorrect password"

  Scenario: Wrong user entered
    Given I am on the login page
    When I fill in "username_login" with "cotcherabcd"
    When I fill in "password_login" with "nonsense"
    When I press "Submit"
    Then I should see "User does not exist"

 Scenario: Wrong user entered
    Given I am on the login page
    When I fill in "username_login" with "cotcherabcd"
    When I fill in "password_login" with "nonsense"
    When I press "Submit"
    Then I should see "User does not exist"
