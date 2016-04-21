Feature: Create Questions

  As a Student
  I want to be able to ask questions from instructor and other students

Background: courses in database

  Given the following courses exist:
  | cnum        | title                         | term      | start_date    |
  | CS - 200    | Introduction to Programming   | Fall 14   |    1977-05-25 |
  | CS - 300    | Advanced Programming          | Spring 16 |    1982-06-25 |
  | CS - 400    | Ultimate Programming          | Fall 16   |    1979-05-25 |
  | CS - 100    | Baby Programming              | Fall 13   |    1971-03-11 |


Scenario: Create thread for a course
  When I go to the show page for course "CS - 400"
  Then I should see "Create new thread"
#   And  I press "Create new thread"
#   And  I fill in "Title" with "hw1"
#   And  I press "Create Thread"
#   Then I should be on on the show page for "CS - 200"
#   And  I should see "hw1"
