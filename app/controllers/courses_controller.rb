class CoursesController < ApplicationController
    # load_and_authorize_resource
    def index
        if current_user.user_type == 'instructor'
            @courses = current_user.courses
        else
            @enrolments = current_user.enrolments
            @courses = @enrolments.map {|e| Course.find_by_id(e.course_id) }
        end
    end

    def show
        @course = Course.find_by_id(params[:id]);
        @cthreads = @course.cthreads.order('title');
       
        if @course.nil?
            flash[:notice] = "Course doesn't exist"
            
            redirect courses_path
        end
    end
    
    def new
        @course = Course.new
    end
    
    def create
        @course = Course.create! course_params
        @course.user = current_user
        @course.save
        flash[:notice] = "#{@course.title} was successfully created."
        redirect_to courses_path
    end
    
    def edit
        @course = Course.find_by_id(params[:id]);
       
        if @course.nil?
            flash[:notice] = "Course doesn't exist"
            
            redirect courses_path
        end
    end
    
    def update
        @course = Course.find_by_id(params[:id])
        
        if @course.nil?
            flash[:notice] = "Course doesn't exist"
        else
            @course.update_attributes! (course_params);
            flash[:notice] = "#{@course.title} was updated successfully."
        end
        
        redirect_to courses_path
    end
    
    def destroy 
        @course = Course.find_by_id(params[:id])
       
        if @course.nil?
            flash[:notice] = "Course doesn't exist"
        else
            @course.destroy
            flash[:notice] = "#{@course.title} was deleted successfully."
        end
        
        redirect_to courses_path
    end

    private
    def course_params
        params.require(:course).permit(:cnum, :title, :term, :start_date)
    end
end
