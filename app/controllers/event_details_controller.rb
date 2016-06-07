class EventDetailsController < ApplicationController
  before_action :set_event_detail, only: [:show, :edit, :update, :destroy]
  permits :status, :event_id, :name, :description, :avatar

  # GET /event_details
  def index
    if params[:event_id]
      session[:event_id] = params[:event_id]
    end
    @event_details = EventDetail.where('event_id=?',session[:event_id])
    @event = Event.find(params[:event_id])
  end

  # GET /event_details/1
  def show
  end

  # GET /event_details/new
  def new
    @event_detail = EventDetail.new
    @event_detail.status = "new"
    @event_detail.event_id = params[:event_id]
  end

  # GET /event_details/1/edit
  def edit
    @event_detail.status = "changed"
  end

  # POST /event_details
  def create(event_detail)
    @event_detail = EventDetail.new(event_detail)

    if @event_detail.save
      redirect_to @event_detail.event, notice: 'Event detail was successfully created.'
    else
      render :new
    end
  end

  # PUT /event_details/1
  def update(event_detail)
    if @event_detail.update(event_detail)
      redirect_to @event_detail.event, notice: 'Event detail was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /event_details/1
  def destroy
    @event_detail.destroy

    redirect_to @event_detail.event, notice: 'Event detail was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_detail(id)
      @event_detail = EventDetail.find(id)
    end
end
