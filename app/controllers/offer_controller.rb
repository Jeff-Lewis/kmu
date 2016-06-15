class OfferController < ApplicationController
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
      @services = Service.paginate_by_sql(Service.ext_sql(session[:cw], session[:year], params[:sql_string]), :page => params[:page], :per_page => 16)
    else
      @services = Service.actionsearch(session[:cw], session[:year], session[:search]).order(date_from: :asc).page(params[:page]).per_page(16)
    end
    @seranz = @services.count
    
    z = 0
    @hash = Gmaps4rails.build_markers(@services) do |service, marker|
      if service.company.latitude != nil and service.company.longitude != nil
        marker.lat service.company.latitude
        marker.lng service.company.longitude
        z=z+1
        marker.infowindow z.to_s+ " " + service.name
#      marker.picture url: "http://images/ma_anonym.png"
      end
     end
  end

  def index2
    session[:page] = params[:page]
    if params[:search]
      session[:search] = params[:search]
    end
    if params[:sql_string] != nil
      @services = Service.paginate_by_sql((params[:sql_string]), :page => params[:page], :per_page => 16)
    else
      @services = Service.search(session[:search]).order(created_at: :desc).page(params[:page]).per_page(16)
    end
    @seranz = @services.count
    z = 0
    @hash = Gmaps4rails.build_markers(@services) do |service, marker|
      if service.company_id != nil
        if service.company.latitude != nil and service.company.longitude != nil
          marker.lat service.company.latitude
          marker.lng service.company.longitude
          z=z+1
          marker.infowindow z.to_s+ " " + service.name + " (" + service.company.name + ")"
  #      marker.picture url: "http://images/ma_anonym.png"
        end
      end
      if service.user_id != nil
        if service.user.latitude != nil and service.user.longitude != nil
          marker.lat service.user.latitude
          marker.lng service.user.longitude
          z=z+1
          marker.infowindow z.to_s+ " " + service.name + " (" + service.user.name + " " + service.user.lastname + ")"
  #      marker.picture url: "http://images/ma_anonym.png"
        end
      end
     end
  end

end
