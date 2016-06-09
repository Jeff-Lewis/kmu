class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  permits :ev_category_id, :status, :active, :user_id, :company_id, :name, :description, :homepage, :geoaddress, :address1, :address2, :address3, :date_from, :date_to, :avatar

  $wochentage = %w[Montag Dienstag Mittwoch Donnerstag Freitag Samstag Sonntag]

  # GET /events
  def index
    if !session[:cw]
      session[:cw] = Date.today.cweek.to_i
    end
    if !session[:year]
      session[:year] = Date.today.year.to_i
    end
    if params[:search]
      session[:search] = params[:search]
    end
    if params[:dir]
      case params[:dir]
        when ">"
          if session[:cw] == 52
            session[:cw] = 1
            session[:year] = session[:year].to_i + 1
          else
            session[:cw] = session[:cw].to_i + 1
          end
        when "<"
          if session[:cw] == 1
            session[:cw] = 52
            session[:year] = session[:year].to_i - 1
          else
            session[:cw] = session[:cw].to_i - 1
          end
      end

    end
    @start = Date.commercial(session[:year],session[:cw],1)
    if params[:sql_string] != nil
      @events = Event.paginate_by_sql(Bid.ext_sql(session[:cw], session[:year], params[:sql_string]), :page => params[:page], :per_page => 10)
    else
      @events = Event.search(session[:cw], session[:year],session[:search]).order(date_from: :asc).page(params[:page]).per_page(10)
    end
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
      redirect_to @event, notice: 'Event was successfully created.'
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
    @event.destroy

    redirect_to events_path :page => session[:page], notice: 'Event was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event(id)
      @event = Event.find(id)
    end
end
