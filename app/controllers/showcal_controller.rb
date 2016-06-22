class ShowcalController < ApplicationController
  def action
    if !session[:cw]
      session[:cw] = Date.today.cweek.to_i
    end
    if !session[:year]
      session[:year] = Date.today.year.to_i
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
    @services = Service.search(session[:cw], session[:year], "action", params[:filter_id], params[:search]).order(date_from: :asc).page(params[:page]).per_page(16)
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

  def bid
   if !session[:cw]
      session[:cw] = Date.today.cweek.to_i
    end
    if !session[:year]
      session[:year] = Date.today.year.to_i
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
    @bids = Bid.search(session[:cw], session[:year], params[:filter_id], params[:search]).order(date_from: :asc).page(params[:page]).per_page(10)
    @bidanz = @bids.count
    
    puts "YEAR" + session[:year].to_s
    puts "KW" + session[:cw].to_s
    puts "START" + @start.to_s
    puts "ANZ" + @eveanz.to_s
    
    z = 0
    @hash = Gmaps4rails.build_markers(@bids) do |bid, marker|
      if bid.latitude != nil and bid.longitude != nil
        marker.lat bid.latitude
        marker.lng bid.longitude
        z=z+1
        marker.infowindow z.to_s+ " " + bid.name
#      marker.picture url: "http://images/ma_anonym.png"
      end
     end
  end

  def event
    if !session[:cw]
      session[:cw] = Date.today.cweek.to_i
    end
    if !session[:year]
      session[:year] = Date.today.year.to_i
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
end
