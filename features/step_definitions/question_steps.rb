Given /the following questions exist/ do |questions_table|
  questions_table.hashes.each do |question|
    Question.create(question)
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
  # flunk "Unimplemented"
end


Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  # flunk "Unimplemented"
  page.body.should match /#{e1}.*#{e2}/m
end