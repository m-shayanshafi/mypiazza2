Feature: Threads
  As an Instructor
  I should be able to add/update/edit new threads in my course

Background: Logged in Properly

  Given a valid instructor
  And I am on the login page
  And a logged in instructor
  And the following courses exist:
  | cnum    | title             | term      | start_date    | user_id   |
  | CS 301  | Advanced Prog     | Fall 16   |   1977-05-25  |   1       |
  | CS 100  | Baby Programming  | Fall 14   |   1982-06-25  |   2       |
 
  And the following threads exist
  | course_id   | title     | posted_on     | created_at    | updated_at    |
  | 1           | hw1       | 1990-05-25    |   1977-05-25  |   1977-05-26  |
  | 2           | hw2       | 1981-05-25    |   1982-06-25  |   1977-05-26  |

Scenario: Add a new thread
  Given I am on the show page for course "CS 301"
  When I follow "Create new thread"
  And I fill in "Title" with "hw3"
  And I press "Create Cthread"
  Then I should be on the show page for course "CS 301"
  And I should see "hw1"
  And I should see "hw3"
  And I should not see "hw2"

Scenario: Edit a new thread
  Given I am on the show page for course "CS 301"
  When I go to the edit page of thread "hw1" for course "CS 301"
  And I fill in "Title" with "hw3"
  And I press "Update Cthread"
  Then I should be on the show page for course "CS 301"
  And I should not see "hw1"
  And I should see "hw3"
  
Scenario: Go back
  Given I am on the show page for course "CS 301"
  When I follow "Back to Courses"
  Then I should be on the courses page