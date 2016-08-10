class AdvisorsController < ApplicationController
  before_action :set_advisor, only: [:show, :edit, :update, :destroy]
  permits :service_id, :user_id, :grade

  # GET /advisors
  def index
    @advisors = Advisor.where('service_id=?', params[:servie_id])
  end

  # GET /advisors/1
  def show
  end

  # GET /advisors/new
  def new
    @advisor = Advisor.new
    @advisor.service_id = params[:service_id]
    @advisor.user_id = params[:user_id]
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
      redirect_to @advisor, notice: 'Advisor was successfully updated.'
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
