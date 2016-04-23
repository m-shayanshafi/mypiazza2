Feature: Answer
  As an Instructor
  I should be able to add/update/edit answers in my course

Background: Logged in Properly

  Given a valid instructor
  And a valid user
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

  And the following questions exist
  | cthread_id | user_id | heading  | statement       | posted_by | created_at | updated_at |
  | 1          | 2       | t1 q2 u2 | not so amazing  | Anonymous | 1977-05-26 | 1977-05-26 |
  | 2          | 1       | t2 q2 u1 | not so bad      | nofel     | 1977-05-26 | 1977-05-26 |
 And the following enrolments exist:
  | course_id   | user_id   | created_at    | updated_at    |
  | 1           | 2         | 1977-05-25    |   1977-05-25  |
 And the following responses exist:
  | question_id | user_id | answer  | posted_by  | created_at | updated_at |
  | 1           | 2       | I am one | Anonymous | 1977-05-26 | 1977-05-26 |
  | 2           | 1       | I am two | nofel     | 1977-05-26 | 1977-05-26 |
 
Scenario: Add a new Answer
  Given I am on the show page of question "t1 q2 u2" for thread "hw1" and course "CS 301"
  When I follow "New Answer"
  And I fill in "Answer" with "testAns"
  And I choose "Anonymous"
  And I press "Create Response"
  Then I should be on the show page of question "t1 q2 u2" for thread "hw1" and course "CS 301"
  And I should see "testAns"
  And I should not see "Anonymous"
  And I should see "t1 q2 u2"
