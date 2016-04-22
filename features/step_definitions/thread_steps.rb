Given /the following threads exist/ do |threads_table|
  threads_table.hashes.each do |thread|
    Cthread.create(thread)
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
  # flunk "Unimplemented"
end