class CoursesController < ApplicationController
    def index
        @courses = Course.all
    end

    def show
        id = params[:id]
       
        @course = Course.find_by_id(id);
       
        if @course.nil?
            flash[:notice] = "the course doesn't exist"
            
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

    private
    def course_params
        params.require(:course).permit(:cnum, :title, :term, :start_date)
    end
end
