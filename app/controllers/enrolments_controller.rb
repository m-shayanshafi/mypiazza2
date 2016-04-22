class EnrolmentsController < ApplicationController
  # before_action :set_enrolment, only: [:show, :edit, :update, :destroy]
  # before_filter :load_group
  before_filter :load_parent
  # GET /enrolments
  # GET /enrolments.json
  def index
    # @enrolments = Enrolment.all
    @enrolments = @course.enrolments
  end

  # GET /enrolments/1
  # GET /enrolments/1.json
  def show
    @enrolment = @course.enrolments.find(params[:id])
  end

  # GET /enrolments/new
  def new
    @enrolment = @course.enrolments.new
  end

  # GET /enrolments/1/edit
  def edit
    @enrolment = @course.enrolments.find(params[:id])
  end

  # POST /enrolments
  # POST /enrolments.json
  def create
    thisuser = User.find_by_email(params[:email])
    if thisuser.blank?
      redirect_to new_course_enrolment_path(@course), notice: 'User not found'
      # format.html { render :new , notice: 'User not found'}
    else
      @enrolment = @course.enrolments.new({:user_id => thisuser.id})
      respond_to do |format|  
        if @enrolment.save
          # UserMailer.course_invite_email(@enrolment, @course).deliver_later
          format.html { redirect_to course_enrolments_url(@course), notice: 'Enrolment was successfully created.' }
          format.json { render :show, status: :created, location: @enrolment }
        else
          format.html { render :new }
          format.json { render json: @enrolment.errors, status: :unprocessable_entity }
        end
      end
    end
      # format.html { redirect_to [@course, @enrolment], notice: 'Enrolment was successfully created.' }
    # @enrolment = @course.enrolments.new(thisuser.id)
    
    # raise SecurityTransgression unless current_user.can_create?(@enrolment)

    # respond_to do |format|
    #   if @enrolment.save
    #     UserMailer.course_invite_email(@enrolment).deliver_later
    #     # format.html { redirect_to @enrolment, notice: 'Enrolment was successfully created.' }
    #     format.html { redirect_to [@course, @enrolment], notice: 'Enrolment was successfully created.' }
    #     format.json { render :show, status: :created, location: @enrolment }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @enrolment.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /enrolments/1
  # PATCH/PUT /enrolments/1.json
  def update
    @enrolment = @course.enrolments.find(params[:id])
    respond_to do |format|
      if @enrolment.update_attributes(params[:enrolment])
      # if @enrolment.update(enrolment_params)
        # format.html { redirect_to @enrolment, notice: 'Enrolment was successfully updated.' }
        format.html { redirect_to [@course, @enrolment], notice: 'Enrolment was successfully created.' }
        format.json { render :show, status: :ok, location: @enrolment }
      else
        format.html { render :edit }
        format.json { render json: @enrolment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrolments/1
  # DELETE /enrolments/1.json
  def destroy
    @enrolment = @course.enrolments.find(params[:id])
    @enrolment.destroy
    respond_to do |format|
      # format.html { redirect_to enrolments_url, notice: 'Enrolment was successfully destroyed.' }
      format.html { redirect_to course_enrolments_url, notice: 'Enrolment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_enrolment
    #   @enrolment = Enrolment.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enrolment_params
      params.require(:enrolment).permit(:course_name, :user_id)
    end
    
    def load_group
      authenticate_user!
      if current_user.user_type == 'instructor'
         return
      else
         redirect_to root_path # or whatever
      end
      # @course = Course.find_by_cnum(params[:user_id])
    end
    
    def load_parent
      @course = Course.find(params[:course_id])
    end
end
