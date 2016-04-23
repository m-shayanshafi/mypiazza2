Given /the following responses exist/ do |responses_table|
  responses_table.hashes.each do |response|
    Response.create(response)
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
  # flunk "Unimplemented"
end