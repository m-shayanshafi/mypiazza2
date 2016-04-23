Given /^a valid instructor$/ do
  @user = User.create!({
             :email => "nofel.my@gmail.com",
             :password => "12345678",
             :password_confirmation => "12345678",
             :user_type => "instructor",
             :name => "nofel"
           })
end

Given /^a logged in instructor$/ do
  fill_in "Email", :with => "nofel.my@gmail.com"
  fill_in "Password", :with => "12345678"
  click_button "Log in"
end

Given /the following courses exist/ do |courses_table|
  courses_table.hashes.each do |course|
    Course.create(course)
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
  # flunk "Unimplemented"
end