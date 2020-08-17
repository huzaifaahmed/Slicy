Feature: update

  Scenario: Correct update
    Given I am on the register page
    When I fill in "firstname" with "james"
    When I fill in "lastname" with "fu"
    When I fill in "username" with "fff"
    When I fill in "twittername" with "james fu"
    When I fill in "password" with "12345"
    When I fill in "email" with "fuzihaoooo@gmail.com"
    When I fill in "address" with "vita"
    When I fill in "postcode" with "S11BA"
    When I fill in "phone" with "07449662823"
    When I press "submit"
    Given I am on the profile page
    Then I should see "Profile"
    When I fill in "email_change" with "1@gmail.com"
    When I fill in "twittername_change" with "1"
    When I fill in "address_change" with "a"
    When I fill in "password_change" with "12345"
    When I fill in "postcode_change" with "s101aa"
    When I fill in "phone_change" with "07449662822"
    When I press "submit"
