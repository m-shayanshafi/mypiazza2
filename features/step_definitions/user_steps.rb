Given /^a valid user$/ do
  @user = User.create!({
             :email => "nofel.my@gmail.com",
             :password => "12345678",
             :password_confirmation => "12345678",
             :user_type => "student"
           })
end

Given /^a logged in user$/ do
  fill_in "Email", :with => "nofel.my@gmail.com"
  fill_in "Password", :with => "12345678"
  click_button "Log in"
end
