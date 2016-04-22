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
  
Scenario: Failed Login
  Given a valid user
  When I go to the login page
  And I fill in "Email" with "nofel.my@gmail.com"
  And I fill in "Password" with "1234567"
  And I press "Log in"
  Then I should be on the login page
  
Scenario: Incorrect Email Signup
  Given I am on the sign up page
  When I fill in "Email" with "nofel.my_gmail.com"
  And I fill in "Password" with "12345678"
  And I fill in "Password confirmation" with "12345678"
  And I press "Sign up"
  Then I should see "Email is invalid"
  
  Scenario: Incorrect Password Signup
  Given I am on the sign up page
  When I fill in "Email" with "nofel.my@gmail.com"
  And I fill in "Password" with "1234567"
  And I fill in "Password confirmation" with "12345678"
  And I press "Sign up"
  Then I should see "Password confirmation doesn't match Password"
  And I should see "Password is too short (minimum is 8 characters)"