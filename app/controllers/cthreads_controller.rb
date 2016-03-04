class CthreadsController < ApplicationController
    def index
        @course = Course.find_by_id(params[:course_id])
        @cthreads = @course.cthreads.order('title')
    end

    def show
        @course = Course.find_by_id(params[:course_id]);
        @cthread = Cthread.find_by_id(params[:id]);
       
        if @cthread.nil?
            flash[:notice] = "Thead #{id} doesn't exist"
            
            redirect_to course_cthreads_path
        end
    end
    
    def new
        @course = Course.find_by_id(params[:course_id])
        @cthread = Cthread.new
    end
    
    def create
        course_id = params[:course_id]
        title = params[:cthread][:title]
        date = Date.new params[:cthread]["posted_on(1i)"].to_i, params[:cthread]["posted_on(2i)"].to_i, params[:cthread]["posted_on(3i)"].to_i
        
        @cthread = Cthread.create! ({:course_id => course_id,:title => title, :posted_on => date})
        flash[:notice] = "#{@cthread.title} for \"#{Course.find_by_id(course_id).title}\" was successfully created."
        
        redirect_to course_cthreads_path
    end
    
    def edit
        @course = Course.find_by_id(params[:course_id])
        @cthread = Cthread.find_by_id(params[:id]);
       
        if @cthread.nil?
            flash[:notice] = "Thead doesn't exist"
            
            redirect course_cthreads_path
        end
    end
    
    def update
        @cthread = Cthread.find_by_id(params[:id])
        new_title = params[:cthread][:title]
        new_date = get_date(params[:cthread])
        
        if @cthread.nil?
            flash[:notice] = "Course doesn't exist"
        else
            @cthread.update_attributes! ({:title => new_title, :posted_on => new_date});
            flash[:notice] = "#{@cthread.title} for \"#{Course.find_by_id(params[:course_id]).title}\" was updated successfully."
        end
        
        redirect_to course_cthreads_path
    end
    
    def destroy 
        @cthread = Cthread.find_by_id(params[:id])
       
        if @cthread.nil?
            flash[:notice] = "Course doesn't exist"
        else
            @cthread.destroy
            flash[:notice] = "#{@cthread.title} was deleted successfully."
        end
        
        redirect_to course_cthreads_path
    end

    private
    def cthread_params
        params.require(:cthread).permit(:title)
    end
    
    def get_date(p)
        Date.new p["posted_on(1i)"].to_i, p["posted_on(2i)"].to_i, p["posted_on(3i)"].to_i
    end
end
