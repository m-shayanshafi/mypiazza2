class CoursesController < ApplicationController
    def index
        @courses = Course.all
    end

    def show
        @course = Course.find_by_id(params[:id]);
       
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
