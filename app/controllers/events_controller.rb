class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  permits :ev_category_id, :status, :active, :user_id, :company_id, :name, :description, :homepage, :geoaddress, :address1, :address2, :address3, :date_from, :date_to, :avatar

  $wochentage = %w[Mo Di Mi Do Fr Sa So]

  # GET /events
  def index
    session[:cw] = nil
    session[:year] = nil
    @events = Event.search(session[:cw], session[:year], params[:filter_id], params[:search]).order(date_from: :asc).page(params[:page]).per_page(10)
    @eveanz = @events.count
    
    z = 0
    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
      if event.latitude != nil and event.longitude != nil
        marker.lat event.latitude
        marker.lng event.longitude
        z=z+1
        marker.infowindow z.to_s+ " " + event.name
#      marker.picture url: "http://images/ma_anonym.png"
      end
     end
  end

  # GET /events/1
  def show
    if params[:topic]
      @topic = params[:topic]
    else
      @topic = "Eventinformation"
    end
  end

  # GET /events/new
  def new
    @event = Event.new
    if params[:user_id]
      @event.user_id = params[:user_id]
      u=User.find(params[:user_id])
      @event.address1 = u.address1
      @event.address2 = u.address2
      @event.address3 = u.address3
    end
    if params[:company_id]
      @event.company_id = params[:company_id]
      c=Company.find(params[:company_id])
      @event.address1 = c.address1
      @event.address2 = c.address2
      @event.address3 = c.address3
    end
    @event.active = true
    @event.date_from = Date.today
    @event.date_to = Date.today
    @event.status = "new"
  end

  # GET /events/1/edit
  def edit
    @event.status = "changed"
  end

  # POST /events
  def create(event)
    @event = Event.new(event)
    if @event.save
      if @event.user_id
        redirect_to user_path(:id => @event.user_id, :topic => "Event"), notice: 'Event was successfully created.'
      end
      if @event.company_id
        redirect_to company_path(:id => @event.company_id, :topic => "Event"), notice: 'Event was successfully created.'
      end
    else
      render :new
    end
  end

  # PUT /events/1
  def update(event)
    if @event.update(event)
        redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /events/1
  def destroy
    if @event.company_id
      @comp = @event.company_id
    end
    if @event.user_id
      @us = @event.user_id
    end
    @event.destroy
    if @us
      redirect_to user_path(:id => @us, :topic => "Event"), notice: 'Event was successfully destroyed.'
    end
    if @comp
      redirect_to company_path(:id => @comp, :topic => "Event"), notice: 'Event was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event(id)
      @event = Event.find(id)
    end
end
