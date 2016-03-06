class TimetracksController < ApplicationController
  before_action :set_timetrack, only: [:show, :edit, :update, :destroy]
  permits :user_id, :workorder_id, :tandm, :amount, :activity, :datum

  def report

    if params[:user_id] != nil
      @user_id = params[:user_id]
      session[:user_id] = @user_id
    else
      @user_id = session[:user_id]
    end
    array = []
    accesses = Access.where("user_id=?", @user_id)
    accesses.each do |ac|
      array << ac.workorder_id
    end
    if array.length > 0
      @workorders = Workorder.where(:id => array)
      if @workorders != nil
        if params[:reporting_date] != nil
          @reporting_date = params[:reporting_date]
          @session[:reporting_date] = @reporting_date
        else
          @reporting_date = session[:reporting_date]
        end
        
        @bom = @reporting_date.to_date.beginning_of_month
        @eom = @reporting_date.to_date.end_of_month
        @tt = Timetrack.where("user_id=? and tandm=? and datum >= ? and datum <= ?", current_user.id, "TIME", @bom, @eom)
        @hours_reported = @tt.sum(:amount)
      else
        redirect_to workorders_path(:parent_id => 0, :company_id => 0), notice: 'No workorders available!'
      end 
    else
      redirect_to workorders_path(:parent_id => 0, :company_id => 0), notice: 'No workorders available!'
    end
  end

  # GET /timetracks
  def index
    @timetracks = Timetrack.where("user_id=? and workorder_id=? and datum>=? and datum<=?", params[:user_id], params[:workorder_id], params[:bom], params[:eom])
    @user_id = params[:user_id]
    @workorder_id = params[:workorder_id]
    @reporting_date = params[:reporting_date]
  end

  # GET /timetracks/1
  def show
  end
  
  # GET /timetracks/new
  def new
    @timetrack = Timetrack.new
    @timetrack.tandm = "TIME"
    @timetrack.user_id = params[:user_id]
    @timetrack.workorder_id = params[:workorder_id]
    @timetrack.datum = params[:reporting_date]
    session[:reporting_date] = params[:reporting_date]
    @timetrack.amount = 0
  end

  # GET /timetracks/1/edit
  def edit
    @tt = Timetrack.all
  end

  # POST /timetracks
  def create(timetrack)
    @timetrack = Timetrack.new(timetrack)
    if @timetrack.save
      redirect_to timetracks_report_path(:user_id => session[:user_id], :reporting_date => session[:reporting_date]), notice: 'Timetrack was successfully created.'
      # redirect_to @timetrack, notice: 'Timetrack was successfully created.'
    else
      render :new
    end
  end

  # PUT /timetracks/1
  def update(timetrack)
    if @timetrack.update(timetrack)
      redirect_to @timetrack, notice: 'Timetrack was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /timetracks/1
  def destroy
    @timetrack.destroy
    redirect_to timetracks_url, notice: 'Timetrack was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timetrack(id)
      @timetrack = Timetrack.find(id)
    end
end
