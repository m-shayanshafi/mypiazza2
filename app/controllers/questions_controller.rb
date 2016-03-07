class QuestionsController < ApplicationController
    def new
        @course = Course.find_by_id(params[:course_id])
        @cthread = @course.cthreads.find_by_id(params[:cthread_id])
        @question = Question.new
    end
    
    def create
        @course = Course.find_by_id(params[:course_id])
        @cthread = @course.cthreads.find_by_id(params[:cthread_id])

        q_params = question_params
        q_params[:cthread_id] = params[:cthread_id]

        @question = @cthread.questions.create! q_params
        flash[:notice] = "Question for #{@cthread.title}, #{@course.title} was successfully created."
        
        redirect_to course_cthread_path(@course, @cthread)
    end

    def edit
        # accessing variables
        @course = Course.find_by_id(params[:course_id])
        @cthread = @course.cthreads.find_by_id(params[:cthread_id]);
        @question = @cthread.questions.find_by_id(params[:id])
    end

    def update
        @course = Course.find_by_id(params[:course_id])
        @cthread = @course.cthreads.find_by_id(params[:cthread_id])
        @question = @cthread.questions.find_by_id(params[:id])

        q_params = question_params
        q_params[:cthread_id] = params[:cthread_id]

        @question.update_attributes! q_params
        flash[:notice] = "Question for #{@cthread.title}, #{@course.title} was successfully updated."
        
        redirect_to course_cthread_path(@course, @cthread)
    end

    # helper functions
    private
    def question_params
        params.require(:question).permit(:heading, :statement, :posted_by)
    end
end