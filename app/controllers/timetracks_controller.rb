class TimetracksController < ApplicationController
  before_action :set_timetrack, only: [:show, :edit, :update, :destroy]
  permits :user_id, :workorder_id, :tandm, :amount, :activity, :datum

  $current_report_date = Date.today

  # GET /timetracks
  def index
    @timetracks = Timetrack.where("user_id=? and workorder_id=? and datum>=? and datum<=?", params[:user_id], params[:workorder_id], params[:bom], params[:eom])
    puts @timetracks.count
  end

  # GET /timetracks/1
  def show
  end
  
  def build_tt
        @tt = Timetrack.where("workorder_id=? and user_id=? and datum>=? and datum<=?", params[:workorder_id], $logon_user_id, $def_date.to_date.beginning_of_month, $def_date.to_date.end_of_month).order(:datum)
  end

  # GET /timetracks/new
  def new
    build_tt
    @timetrack = Timetrack.new
    @timetrack.tandm = "TIME"
    @timetrack.user_id = params[:user_id]
    @timetrack.workorder_id = params[:workorder_id]
    @timetrack.datum = $def_date
    @timetrack.amount = 0
  end

  # GET /timetracks/1/edit
  def edit
    build_tt
  end

  # POST /timetracks
  def create(timetrack)
    @timetrack = Timetrack.new(timetrack)
    if @timetrack.save
      redirect_to workorders_report_path(:user_id => $logon_user_id, :parent_id => 0), notice: 'Timetrack was successfully created.'
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
