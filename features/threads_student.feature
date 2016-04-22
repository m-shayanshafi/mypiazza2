Feature: Courses
  As an Instructor
  I should be able to add/update/edit new courses

Background: Logged in Properly

  Given a valid user
  And I am on the login page
  And the following courses exist:
  | cnum    | title             | term      | start_date    | user_id   |
  | CS 301  | Advanced Prog     | Fall 16   |   1977-05-25  |   1       |
  | CS 100  | Baby Programming  | Fall 14   |   1982-06-25  |   2       |
 
  And the following threads exist
  | course_id   | title     | posted_on     | created_at    | updated_at    |
  | 1           | hw1       | 1990-05-25    |   1977-05-25  |   1977-05-26  |
  | 2           | hw2       | 1981-05-25    |   1982-06-25  |   1977-05-26  |



