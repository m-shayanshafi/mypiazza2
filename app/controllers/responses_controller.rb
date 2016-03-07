class ResponsesController < ApplicationController
    def show
        # accessing variables
        @course = Course.find_by_id(params[:course_id]);
        @cthread = Cthread.find_by_id(params[:cthread_id]);
        @question = Question.find_by_id(params[:question_id])
        @response = Response.find_by_id(params[:id])
    end

    def new
        @course = Course.find_by_id(params[:course_id])
        @cthread = Cthread.find_by_id(params[:cthread_id])
        @question = Question.find_by_id(params[:question_id])
        @response = Response.new
    end
    
    def create
        @course = Course.find_by_id(params[:course_id])
        @cthread = Cthread.find_by_id(params[:cthread_id]);
        @question = Question.find_by_id(params[:question_id])

        r_params = response_params
        r_params[:question_id] = params[:question_id]

        @response = @question.responses.create! r_params
        flash[:notice] = "Answer for #{@question.heading}, #{@cthread.title}, #{@course.title} was successfully posted."
        
        redirect_to course_cthread_question_path(@course, @cthread, @question)
    end

    # helper functions
    private
    def response_params
        params.require(:response).permit(:answer, :posted_by)
    end
end
