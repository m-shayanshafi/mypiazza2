Feature: Threads
  As an Instructor
  I should be able to add/update/edit new threads in my course

Background: Logged in Properly

  Given a valid user
  And I am on the login page
  And a logged in user
  And the following courses exist:
  | cnum    | title             | term      | start_date    | user_id   |
  | CS 301  | Advanced Prog     | Fall 16   |   1977-05-25  |   3       |
  | CS 100  | Baby Programming  | Fall 14   |   1982-06-25  |   4       |
 And the following enrolments exist:
  | course_id   | user_id   | created_at    | updated_at    |
  | 1           | 1         | 1977-05-25    |   1977-05-25  |
  | 2           | 2         | 1977-05-25    |   1982-06-25  |
 And the following threads exist:
 | course_id   | title     | posted_on     | created_at    | updated_at    |
 | 1           | hw1       | 1990-05-25    |   1977-05-25  |   1977-05-26  |
 | 2           | hw2       | 1981-05-25    |   1982-06-25  |   1977-05-26  |

Scenario: Add a new thread
  Given I am on the show page for course "CS 301"
  Then I should not see "Create new thread"
  And I should not see "Edit"
  And I should see "hw1"
  And I should not see "hw2"

Scenario: Go back
  Given I am on the show page for course "CS 301"
  When I follow "Back to Courses"
  Then I should be on the courses page