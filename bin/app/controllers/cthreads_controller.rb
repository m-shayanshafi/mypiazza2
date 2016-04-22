class CthreadsController < ApplicationController
    def index
        # accessing variables
        @isinstructor = false
        @course = Course.find_by_id(params[:course_id])
        @cthreads = @course.cthreads.order('title')
        if current_user.user_type == "instructor"
            @isinstructor = true
        end

        # redirecting if invalid path in URI
        redirect_invalid(@course, @cthread, params)
    end

    def show
        # accessing variables
        @isinstructor = false
        @course = Course.find_by_id(params[:course_id]);
        @cthread = @course.cthreads.find_by_id(params[:id]);
        @questions = @cthread.questions
        @user_names=Hash.new()
        @questions.each do |question|
            id=question.user_id
            user=User.find_by_id(id);
            @user_names[id]=user.name
        end
       if current_user.user_type == 'instructor'
            @isinstructor = true
       end
        # redirecting if invalid path in URI
        redirect_invalid(@course, @cthread, params)
    end
    
    def new
        @course = Course.find_by_id(params[:course_id])
        @cthread = Cthread.new
    end
    
    def create
        @course = Course.find_by_id(params[:course_id])

        # else inserting the data
        title = params[:cthread][:title]
        date = Date.new params[:cthread]["posted_on(1i)"].to_i, params[:cthread]["posted_on(2i)"].to_i, params[:cthread]["posted_on(3i)"].to_i
        
        @cthread = Cthread.create! ({:course_id => @course.id,:title => title, :posted_on => date})
        flash[:notice] = "#{@cthread.title}, #{@course.title} was successfully created."
        
        redirect_to course_path(@course.id)
    end
    
    def edit
        # accessing variables
        @course = Course.find_by_id(params[:course_id])
        @cthread = @course.cthreads.find_by_id(params[:id]);
       
        # redirecting if invalid path in URI
        redirect_invalid(@course, @cthread, params)
    end
    
    def update
        # accessing variables
        @course = Course.find_by_id(params[:course_id])
        @cthread = Cthread.find_by_id(params[:id])

        # redirecting if invalid path in URI
        redirect_invalid(@course, @cthread, params) 

        # else updating data
        new_title = params[:cthread][:title]
        new_date = get_date(params[:cthread])
    
        @cthread.update_attributes! ({:title => new_title, :posted_on => new_date});
        flash[:notice] = "#{@cthread.title}, #{@course.title} was updated successfully."
        
        redirect_to course_path(@course.id)
    end
    
    def destroy 
        # accessing variables
        @course = Course.find_by_id(params[:course_id])
        @cthread = Cthread.find_by_id(params[:id])

        # redirecting if invalid path in URI
        redirect_invalid(@course, @cthread, params) 
       
        if @cthread.nil?
            flash[:notice] = "Course doesn't exist"
        else
            @cthread.destroy
            flash[:notice] = "#{@cthread.title} was deleted successfully."
        end
        
        redirect_to course_path(params[:course_id])
    end

    # helper functions
    private
    def cthread_params
        params.require(:cthread).permit(:title)
    end
    
    def get_date(p)
        Date.new p["posted_on(1i)"].to_i, p["posted_on(2i)"].to_i, p["posted_on(3i)"].to_i
    end

    def redirect_invalid(course, cthread, params)
        if course.nil?
            flash[:notice] = "Course #{params[:course_id]} doesn't exist"

            redirect_to courses_path
        else
            if cthread.nil?
                flash[:notice] = "Thead #{params[:id]} doesn't exist"
                
                redirect_to course_path(params[:course_id])
            end
        end
    end
end
