class QuestionsController < ApplicationController
    # load_and_authorize_resource
    def show
        # accessing variables
        @course = Course.find_by_id(params[:course_id]);
        @cthread = Cthread.find_by_id(params[:cthread_id]);
        @question = Question.find_by_id(params[:id])
        @question_by=User.find_by_id(@question.user_id).name
        # @users=@question.users
        @responses = @question.responses
        @user_names=Hash.new()
        @responses.each do |question|
            id=question.user_id
            user=User.find_by_id(id);
            @user_names[id]=user.name
        end
    end

    def new
        @course = Course.find_by_id(params[:course_id])
        @cthread = Cthread.find_by_id(params[:cthread_id])
        @question = Question.new
    end
    
    def create
        @course = Course.find_by_id(params[:course_id])
        @cthread = Cthread.find_by_id(params[:cthread_id]);

        q_params = question_params
        q_params[:cthread_id] = params[:cthread_id]
        # q_params[:user_id] = current_user
        @question = @cthread.questions.create! q_params
        @question.user=current_user;
        @question.save
        
        flash[:notice] = "Question for #{@cthread.title}, #{@course.title} was successfully created."
        
        redirect_to course_cthread_path(@course, @cthread)
    end

    def edit
        # accessing variables
        @course = Course.find_by_id(params[:course_id])
        @cthread = Cthread.find_by_id(params[:cthread_id]);
        @question = Question.find_by_id(params[:id])
    end

    def update
        @course = Course.find_by_id(params[:course_id])
        @cthread = Cthread.find_by_id(params[:cthread_id]);
        @question = Question.find_by_id(params[:id])

        q_params = question_params
        q_params[:cthread_id] = params[:cthread_id]

        @question.update_attributes! q_params
        flash[:notice] = "Question for #{@cthread.title}, #{@course.title} was successfully updated."
        
        redirect_to course_cthread_path(@course, @cthread)
    end

    def destroy 
        # accessing variables
        @course = Course.find_by_id(params[:course_id])
        @cthread = Cthread.find_by_id(params[:cthread_id])
        @question = Question.find_by_id(params[:id])
       
        if @question.nil?
            flash[:notice] = "Question doesn't exist"
        else
            @question.destroy
            flash[:notice] = "#{@question.heading} was deleted successfully."
        end
        
        redirect_to course_cthread_path(@course, @cthread)
    end

    # helper functions
    private
    def question_params
        params.require(:question).permit(:heading, :statement, :posted_by)
    end
end