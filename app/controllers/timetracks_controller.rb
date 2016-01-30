class TimetracksController < ApplicationController
  before_action :set_timetrack, only: [:show, :edit, :update, :destroy]
  permits :user_id, :workorder_id, :tandm, :amount, :activity, :datum

  # GET /timetracks
  def index
    @timetracks = Timetrack.all
  end

  # GET /timetracks/1
  def show
  end

  # GET /timetracks/new
  def new
    @timetrack = Timetrack.new
  end

  # GET /timetracks/1/edit
  def edit
  end

  # POST /timetracks
  def create(timetrack)
    @timetrack = Timetrack.new(timetrack)

    if @timetrack.save
      redirect_to @timetrack, notice: 'Timetrack was successfully created.'
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
