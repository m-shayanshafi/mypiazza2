class CthreadsController < ApplicationController
    def index
        @course = Course.find_by_id(params[:course_id])
        
        @cthreads = @course.cthreads
    end

    def show
        id = params[:id]
       
        @cthread = Cthread.find_by_id(id);
       
        if @cthread.nil?
            flash[:notice] = "Thead doesn't exist"
            
            redirect cthreads_path
        end
    end
    
    def new
        @cthread = Cthread.new
    end
    
    def create
        @cthread = Cthread.create! cthread_params
        flash[:notice] = "#{@cthread.title} was successfully created."
        redirect_to courses_path
    end
    
    def edit
        id = params[:id]
       
        @cthread = Cthread.find_by_id(id);
       
        if @cthread.nil?
            flash[:notice] = "Course doesn't exist"
            
            redirect cthreads_path
        end
    end
    
    def update
        @cthread = Cthread.find_by_id(params[:id])
        
        if @cthread.nil?
            flash[:notice] = "Course doesn't exist"
        else
            @cthread.update_attributes! (cthread_params);
            flash[:notice] = "#{@cthread.title} was updated successfully."
        end
        
        redirect_to courses_path
    end
    
    def destroy 
        @cthread = Cthread.find_by_id(params[:id])
       
        if @cthread.nil?
            flash[:notice] = "Course doesn't exist"
        else
            @cthread.destroy
            flash[:notice] = "#{@cthread.title} was deleted successfully."
        end
        
        redirect_to courses_path
    end

    private
    def cthread_params
        params.require(:cthread).permit(:title)
    end
end
