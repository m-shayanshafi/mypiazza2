Given /the following questions exist/ do |questions_table|
  questions_table.hashes.each do |question|
    Question.create(question)
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
  # flunk "Unimplemented"
end