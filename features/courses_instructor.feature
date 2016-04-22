Feature: Courses
  As an Instructor
  I should be able to add/update/edit new courses

Background: Logged in Properly

  Given a valid instructor
  And I am on the login page
  And the following courses exist:
  | cnum    | title             | term      | start_date    | user_id   |
  | CS 301  | Advanced Prog     | Fall 16   |   1977-05-25  |   1       |
  | CS 100  | Baby Programming  | Fall 14   |   1982-06-25  |   2       |
  
Scenario: add new course
  Given a logged in instructor
  When I go to the new page for courses
  And  I fill in "Cnum" with "CS 200"
  And  I fill in "Title" with "Intro to Programming"
  And I fill in "Term" with "Fall 15"
  And I press "Create Course"
  Then I should be on the courses page
  And I should see "CS 200"
  And I should see "CS 301"
  And I should not see "CS 100"
  
Scenario: edit a course
  Given a logged in instructor
  And I am on the courses page
  When I go to the edit page for course "CS 301"
  And  I fill in "Cnum" with "CS 302"
  And  I press "Update Course"
  Then I should be on the courses page
  And I should see "CS 302"
  And I should not see "CS 301"

  