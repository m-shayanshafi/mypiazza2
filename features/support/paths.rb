# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'

    when /^the login page$/
      '/users/sign_in'
      
    when /^the sign up page$/
      '/users/sign_up'

    when /^the new page for courses$/
      new_course_path
    
    when /^the edit page for course "(.*)"$/
      edit_course_path(Course.find_by_cnum($1))
    
    when /^the courses page$/
      '/courses'
      
    when /^new thread for course "(.*)"$/
      course_path(Course.find_by_cnum($1)) + '/cthreads/new'
      
    when /^the enrolments page for course "(.*)"$/
      course_path(Course.find_by_cnum($1)) + '/enrolments'
      
    when /^the edit page of thread "(.*)" for course "(.*)"$/
      course_path(Course.find_by_cnum($2)) + '/cthreads/' + Cthread.find_by_title($1).id.to_s + '/edit'
      # edit_course_cthread_path(Cthread.find_by_title($1))
    when /^the show page of thread "(.*)" for course "(.*)"$/
      course_path(Course.find_by_cnum($2)) + '/cthreads/' + Cthread.find_by_title($1).id.to_s
      
    when /^the edit page of question "(.*)" for thread "(.*)" and course "(.*)"$/
      course_path(Course.find_by_cnum($3)) + '/cthreads/' + Cthread.find_by_title($2).id.to_s + '/questions/' + Question.find_by_heading($1).id.to_s + '/edit'
    
    when /^the show page of question "(.*)" for thread "(.*)" and course "(.*)"$/
      course_path(Course.find_by_cnum($3)) + '/cthreads/' + Cthread.find_by_title($2).id.to_s + '/questions/' + Question.find_by_heading($1).id.to_s
    
      
    when /^the show page for course "(.*)"$/
      course_path(Course.find_by_cnum($1))
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
