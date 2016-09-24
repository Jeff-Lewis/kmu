class HotspotsController < ApplicationController
  before_action :set_hotspot, only: [:show, :edit, :update, :destroy]
  permits :user_id, :status, :active, :homepage, :hs_category_id, :name, :description, :geo_address, :address1, :address2, :address3, :latitude, :longitude, :stichworte

  # GET /hotspots
  def index
    if params[:page] != nil
      session[:page] = params[:page]
    end
    @hotspots = Hotspot.search(params[:filter_id], params[:search]).page(params[:page]).per_page(10)
    @hsanz = @hotspots.count

    z = 0
    @hash = Gmaps4rails.build_markers(@hotspots) do |hotspot, marker|
      if hotspot.latitude != nil and hotspot.longitude != nil
        marker.lat hotspot.latitude
        marker.lng hotspot.longitude
        z=z+1
        marker.infowindow z.to_s+ " " + hotspot.name
      end 
     end
  end

  # GET /hotspots/1
  def show
    if params[:topic]
      @topic = params[:topic]
    else
      @topic = "Hotspotinformation"
    end
  end

  # GET /hotspots/new
  def new
    @hotspot = Hotspot.new
    @hotspot.active = true
    @hotspot.status = "new"
    @hotspot.user_id = params[:user_id]
  end

  # GET /hotspots/1/edit
  def edit
  end

  # POST /hotspots
  def create(hotspot)
    @hotspot = Hotspot.new(hotspot)

    if @hotspot.save
      redirect_to @hotspot, notice: 'Hotspot was successfully created.'
    else
      render :new
    end
  end

  # PUT /hotspots/1
  def update(hotspot)
    if @hotspot.update(hotspot)
      redirect_to @hotspot, notice: 'Hotspot was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /hotspots/1
  def destroy
    @hotspot.destroy

    redirect_to hotspots_path :page => session[:page], notice: 'Hotspot was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotspot(id)
      @hotspot = Hotspot.find(id)
    end
end
