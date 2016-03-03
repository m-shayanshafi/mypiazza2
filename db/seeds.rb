# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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
    Course.create! (course)
 end
