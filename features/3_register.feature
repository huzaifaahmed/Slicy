Feature: register

  Scenario: Correct Registration
    Given I am on the register page
    Then I should see "Register with Pizza Shed"

  Scenario: Correct Registration
    Given I am on the register page
    When I fill in "firstname" with "james"
    When I fill in "lastname" with "fu"
    When I fill in "username" with "zz"
    When I fill in "twittername" with "james fu"
    When I fill in "password" with "12345"
    When I fill in "email" with "fuzihaoooo@gmail.com"
    When I fill in "address" with "vita"
    When I fill in "postcode" with "S11BA"
    When I fill in "phone" with "07449662823"
    When I press "submit"
    Then I should see "Pizza Shed"

  Scenario: empty firstname
    Given I am on the register page
    When I fill in "firstname" with ""
    When I press "submit"
    Then I should see "There were errors in your form submission, please correct them below."

  Scenario: empty lastname
    Given I am on the register page
    When I fill in "firstname" with "james"
    When I fill in "lastname" with ""
    When I press "submit"
    Then I should see "There were errors in your form submission, please correct them below."

  Scenario: empty username
    Given I am on the register page
    When I fill in "firstname" with "james"
    When I fill in "lastname" with "fu"
    When I fill in "username" with ""
    When I press "submit"
    Then I should see "There were errors in your form submission, please correct them below."

  Scenario: empty password
    Given I am on the register page
    When I fill in "firstname" with "james"
    When I fill in "lastname" with "fu"
    When I fill in "username" with "abcde"
    When I fill in "password" with ""
    When I press "submit"
    Then I should see "There were errors in your form submission, please correct them below."

  Scenario: empty email
    Given I am on the register page
    When I fill in "firstname" with "james"
    When I fill in "lastname" with "fu"
    When I fill in "username" with "abcdef"
    When I fill in "password" with "abc"
    When I fill in "email" with ""
    When I press "submit"
    Then I should see "There were errors in your form submission, please correct them below."

  Scenario: empty address
    Given I am on the register page
    When I fill in "firstname" with "james"
    When I fill in "lastname" with "fu"
    When I fill in "username" with "abcdefg"
    When I fill in "password" with "abc"
    When I fill in "email" with "fuzihaoooo@gmail.com"
    When I fill in "address" with ""
    When I press "submit"
    Then I should see "There were errors in your form submission, please correct them below."

  Scenario: empty post code
    Given I am on the register page
    When I fill in "firstname" with "james"
    When I fill in "lastname" with "fu"
    When I fill in "username" with "abcdefgh"
    When I fill in "password" with "abc"
    When I fill in "email" with "fuzihaoooo@gmail.com"
    When I fill in "address" with "vita"
    When I fill in "postcode" with ""
    When I press "submit"
    Then I should see "There were errors in your form submission, please correct them below."

  Scenario: empty phone number
    Given I am on the register page
    When I fill in "firstname" with "james"
    When I fill in "lastname" with "fu"
    When I fill in "username" with "abcdefghi"
    When I fill in "password" with "abc"
    When I fill in "email" with "fuzihaoooo@gmail.com"
    When I fill in "address" with "vita"
    When I fill in "postcode" with "S11BA"
    When I fill in "phone" with ""
    When I press "submit"
    Then I should see "There were errors in your form submission, please correct them below."

  Scenario: post code entered with space
    Given I am on the register page
    When I fill in "firstname" with "james"
    When I fill in "lastname" with "fu"
    When I fill in "username" with "abcdefghij"
    When I fill in "password" with "abc"
    When I fill in "email" with "fuzihaoooo@gmail.com"
    When I fill in "address" with "vita"
    When I fill in "postcode" with "S1 1BA"
    When I fill in "phone" with "07449662823"
    When I press "submit"
    Then I should see "There were errors in your form submission, please correct them below."

  Scenario: email entered without an '@'
    Given I am on the register page
    When I fill in "firstname" with "james"
    When I fill in "lastname" with "fu"
    When I fill in "username" with "abcdefghijkl"
    When I fill in "password" with "abc"
    When I fill in "email" with "f"
    When I fill in "address" with "vita"
    When I fill in "postcode" with "S1 1BA"
    When I fill in "phone" with "07449662823"
    When I press "submit"
    Then I should see "There were errors in your form submission, please correct them below."
