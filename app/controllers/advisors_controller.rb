class AdvisorsController < ApplicationController
  before_action :set_advisor, only: [:show, :edit, :update, :destroy]
  permits :service_id, :user_id, :grade

  # GET /advisors
  def index
    if params[:search]
      session[:search] = params[:search]
    end
    if params[:service_id]
      session[:service_id] = params[:service_id]
    end
    if params[:page]
      session[:page] = params[:page]
    end
    
    if params[:advisor_id]
      @advisor = Advisor.where('service_id=? and user_id=?', session[:service_id], params[:advisor_id]).first
      if !@advisor
        @advisor = Advisor.new
        @advisor.user_id = params[:advisor_id]
        @advisor.service_id = session[:service_id]
      end
      @advisor.grade = "Berater"
      @advisor.save
    end
    if params[:senior_advisor_id]
      @advisor = Advisor.where('service_id=? and user_id=?', session[:service_id], params[:senior_advisor_id]).first
      if !@advisor
        @advisor = Advisor.new
        @advisor.user_id = params[:advisor_id]
        @advisor.service_id = session[:service_id]
      end
      @advisor.grade = "Senior Berater"
      @advisor.save
    end
    if params[:delete_advisor_id]
      @advisor = Advisor.where('service_id=? and user_id=?', session[:service_id], params[:delete_advisor_id]).first
      if @advisor
        @advisor.destroy
      end
    end

    @users = User.search(false, session[:search]).page(params[:page]).per_page(10)
    @advisors = Advisor.where('service_id=?', session[:service_id])
    @service = Service.find(session[:service_id])
    @array=[]
    @advisors.each do |ad|
      hash = Hash.new
      hash = {"key" => ad.user_id, "grade" => ad.grade}
      @array << hash
    end
    
  end

  # GET /advisors/1
  def show
  end

  # GET /advisors/new
  def new
    @advisor = Advisor.new
    @advisor.service_id = params[:service_id]
    @advisor.user_id = params[:user_id]
    @advisor.grade = params[:grade]
    @advisor.save
    redirect_to @advisor.service
  end

  # GET /advisors/1/edit
  def edit
  end

  # POST /advisors
  def create(advisor)
    @advisor = Advisor.new(advisor)

    if @advisor.save
      redirect_to @advisor, notice: 'Advisor was successfully created.'
    else
      render :new
    end
  end

  # PUT /advisors/1
  def update(advisor)
    if @advisor.update(advisor)
      redirect_to @advisor.service, notice: 'Advisor was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /advisors/1
  def destroy
    @service = @advisor.service
    @advisor.destroy
    redirect_to @service, notice: 'Advisor was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advisor(id)
      @advisor = Advisor.find(id)
    end
end
