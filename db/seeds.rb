# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cthreads = [
    {:title => "hw1", :posted_on => '30-Jan-2016'},
    {:title => "hw2", :posted_on => '10-Feb-2016'},
    {:title => "hw3", :posted_on => '20-Feb-2016'}
]
questions = [
    {heading: "when is it due?", statement: "i wanted to ask about the
        due date of the assignment", posted_by: "anon"},
    {heading: "extension?", statement: "please extend deadline", posted_by: "nofel yasin"}
]


seed_courses = [
    {:cnum => 'CS 202', :title => 'Data Structures', :term => 'Spring 2016',
    :start_date => '17-Jan-2016'},
    {:cnum => 'CS 300', :title => 'Advanced  Programming', :term => 'Spring 2016',
    :start_date => '17-Jan-2016'},
    {:cnum => 'CS 375', :title => 'Databases', :term => 'Fall 2015-16',
    :start_date => '17-Jan-2016'}
 ]
 
 # NOTE: the following line temporarily allows mass assignment
 # (needed if you used attr_accessible/attr_protected in movie.rb)
 
 seed_courses.each do |course|
    crs = Course.create! (course)
    crs.cthreads.create cthreads[0]
    crs.cthreads.create cthreads[1]
    crs.cthreads.create cthreads[2]
 end

user = User.new
user.email = 'shayan@gmail.com'
user.name = 'Shayan Shafi'
user.password = 'shayanshafi'
user.password_confirmation = 'shayanshafi'
user.user_type = 'instructor'
user.save

u = User.create!({:name => "Muqsit Nawaz", :email => "muqsitnawaz@gmail.com",
    :password => "B.D.c00p3r", :password_confirmation => "B.D.c00p3r", :user_type => "student"})


u1 = User.create!({:name => "Nofel Yasin", :email => "nofelyasin@yahoo.com",
    :password => "nofelyasin", :password_confirmation => "nofelyasin", :user_type => "student"})