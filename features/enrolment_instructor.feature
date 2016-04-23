Feature: Courses
  As an Instructor
  I should be able to add/update/edit new courses

Background: Logged in Properly

  Given a valid instructor
  And a valid user
  And I am on the login page
  And a logged in instructor
  And the following courses exist:
  | cnum    | title             | term      | start_date    | user_id   |
  | CS 301  | Advanced Prog     | Fall 16   |   1977-05-25  |   1       |
  | CS 100  | Baby Programming  | Fall 14   |   1982-06-25  |   2       |

Scenario: Check enrolment visible
  When I am on the courses page
  Then I should see "Manage Enrolments"
  
Scenario: Add Enrolments
  Given I am on the enrolments page for course "CS 301"
  When I follow "New Enrolment"
  And I fill in "Email:" with "shan@gmail.com"
  And I press "Create"
  Then I should be on the enrolments page for course "CS 301"
  And I should see "shan"
  And I should see "Destroy"