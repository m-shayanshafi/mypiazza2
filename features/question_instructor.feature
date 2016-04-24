Feature: Question
  As an Instructor
  I should be able to add/update/edit new questions in my course

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
  | 1          | 2       | t1 q2 u3 | sort test       | Anonymous | 1977-05-27 | 1977-05-27 |
 
 And the following enrolments exist:
  | course_id   | user_id   | created_at    | updated_at    |
  | 1           | 2         | 1977-05-25    |   1977-05-25  |
 
Scenario: Sorted Question
  Given I am on the show page of thread "hw1" for course "CS 301"
  Then I should see "sort test" before "not so amazing"
  
Scenario: Add a new Question
  Given I am on the show page of thread "hw1" for course "CS 301"
  When I follow "New question"
  And I fill in "Heading" with "testHead"
  And I fill in "Statement" with "testStatement"
  And I press "Create Question"
  Then I should be on the show page of thread "hw1" for course "CS 301"
  And I should see "nofel"
  And I should see "testHead"
  And I should see "t1 q2 u2"
  And I should not see "t2 q2 u1"

Scenario: Add an anonymous new Question
  Given I am on the show page of thread "hw1" for course "CS 301"
  When I follow "New question"
  And I fill in "Heading" with "testHead"
  And I fill in "Statement" with "testStatement"
  And I choose "Anonymous"
  And I press "Create Question"
  Then I should be on the show page of thread "hw1" for course "CS 301"
  And I should not see "Anonymous"
  And I should see "t1 q2 u2"
  And I should see "testHead"

Scenario: Edit Question
  Given I am on the edit page of question "t1 q2 u2" for thread "hw1" and course "CS 301"
  When I fill in "Heading" with "testHead"
  And I fill in "Statement" with "testStatement"
  And I choose "Anonymous"
  And I press "Update Question"
  Then I should be on the show page of thread "hw1" for course "CS 301"
  And I should not see "Anonymous"
  And I should not see "t1 q2 u2"
  And I should see "testHead"

