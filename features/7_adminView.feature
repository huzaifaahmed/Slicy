Feature: admin view

  Scenario: correct admin page
    Given I am on the login page
    When I fill in "username_login" with "admin"
    When I fill in "password_login" with "password"
    When I press "Submit"
    Given I am on the admin page
    Then I should see "Administrator View"

  Scenario: correct admin page
    Given I am on the register page
    When I fill in "firstname" with "a"
    When I fill in "lastname" with "a"
    When I fill in "username" with "zzz"
    When I fill in "twittername" with "a"
    When I fill in "password" with "12345"
    When I fill in "email" with "a@gmail.com"
    When I fill in "address" with "a"
    When I fill in "postcode" with "S11BA"
    When I fill in "phone" with "07449662823"
    When I press "submit"
    Then I should see "Pizza Shed"
    Given I am on the login page
    When I fill in "username_login" with "admin"
    When I fill in "password_login" with "password"
    When I press "Submit"
    Given I am on the admin page
    Then I should see "Administrator View"
    When I fill in "search" with "zzz"
    When I press "submit"
    Then I should see "Id"
    Then I should see "Set selected user role"
    Then I should see "Delete account"

  Scenario: admin can change the role of the user
    Given I am on the login page
    When I fill in "username_login" with "admin"
    When I fill in "password_login" with "password"
    When I press "Submit"
    Given I am on the admin page
    Then I should see "Administrator View"
    When I fill in "search" with "zzz"
    When I press "submit"
    Then I should see "0"
    When I select "Order Handler" from "user_status"
    When I press "Apply"
    When I fill in "search" with "zzz"
    When I press "submit"
    Then I should see "2"
    When I fill in "search" with "zzz"
    When I press "submit"
    When I select "User" from "user_status"
    When I press "Apply"
    When I fill in "search" with "zzz"
    When I press "submit"
    Then I should see "0"
    When I fill in "search" with "zzz"
    When I press "submit"
    When I select "Administrator" from "user_status"
    When I press "Apply"
    When I fill in "search" with "zzz"
    When I press "submit"
    Then I should see "1"

  Scenario: admin can delete user
    Given I am on the login page
    When I fill in "username_login" with "admin"
    When I fill in "password_login" with "password"
    When I press "Submit"
    Given I am on the admin page
    Then I should see "Administrator View"
    When I fill in "search" with "zzz"
    When I press "submit"
    When I check "delete_user"
    When I press "Apply"
    When I fill in "search" with "zzz"
    When I press "submit"
    Then I should not see "Id"
