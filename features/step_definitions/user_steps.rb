Given /^a valid user$/ do
  @user = User.create!({
             :email => "shan@gmail.com",
             :password => "123456789",
             :password_confirmation => "123456789",
             :user_type => "student",
             :name => 'shan'
           })
end

Given /^a logged in user$/ do
  fill_in "Email", :with => "shan@gmail.com"
  fill_in "Password", :with => "123456789"
  click_button "Log in"
end
