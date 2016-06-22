class OfferController < ApplicationController
#  $wochentage = %w[Montag Dienstag Mittwoch Donnerstag Freitag Samstag Sonntag]

  # GET /events
  def index
    if params[:page]
      session[:page] = params[:page]
    end
    @stype = params[:stype]
    @services = Service.search(params[:cw], params[:year], params[:stype], params[:filter_id], params[:search]).order(created_at: :desc).page(params[:page]).per_page(16)
    @seranz = @services.count

    z = 0
    @hash = Gmaps4rails.build_markers(@services) do |service, marker|
      if service.company_id != nil
        if service.company.latitude != nil and service.company.longitude != nil
          marker.lat service.company.latitude
          marker.lng service.company.longitude
          z=z+1
          marker.infowindow z.to_s+ " " + service.name + " (" + service.company.name + ")"
        end
      end
      if service.user_id != nil
        if service.user.latitude != nil and service.user.longitude != nil
          marker.lat service.user.latitude
          marker.lng service.user.longitude
          z=z+1
          marker.infowindow z.to_s+ " " + service.name + " (" + service.user.name + " " + service.user.lastname + ")"
        end
      end
     end
  end

end
