class UserMailer < ApplicationMailer
    default from: 'lumspiazza@gmail.com'
 
    def course_invite_email(enrolment,course)
        @course = course
        @enrolment = enrolment
        @user = User.find(@enrolment.user_id)
        mail(to: @user.email, subject: 'You are now enrolled in #{@enrolment.course_name}')
    end
end
