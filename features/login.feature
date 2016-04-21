Feature: Sign in with user
  As a User
  I should be able to login successfully

Scenario: Login
  Given a valid user
  When I go to the login page
  And I fill in "Email" with "nofel.my@gmail.com"
  And I fill in "Password" with "12345678"
  And I press "Log in"
  Then I should see "Signed in successfully."
  
Scenario: Signup
  Given I am on the sign up page
  When I fill in "Email" with "nofel.my@gmail.com"
  And I fill in "Password" with "12345678"
  And I fill in "Password confirmation" with "12345678"
  And I press "Sign up"
  Then I should see "signed up successfully."