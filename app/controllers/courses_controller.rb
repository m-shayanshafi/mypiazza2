class CoursesController < ApplicationController
    def index
        @courses = Course.all
    end

    def show
        id = params[:id]
       
        @course = Course.find_by_id(id);
       
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
        flash[:notice] = "#{@course.title} was successfully created."
        redirect_to courses_path
    end
    
    def edit
        id = params[:id]
       
        @course = Course.find_by_id(id);
       
        if @course.nil?
            flash[:notice] = "Course doesn't exist"
            
            redirect courses_path
        end
    end
    
    def update
        @course = Course.find(params[:id])
        @course.update_attributes! (course_params);
        
        flash[:notice] = "#{@course.title} was updated successfully."
        redirect_to courses_path
    end

    private
    def course_params
        params.require(:course).permit(:cnum, :title, :term, :start_date)
    end
end
