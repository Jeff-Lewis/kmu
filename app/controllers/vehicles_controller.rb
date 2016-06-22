class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  permits :status, :user_id, :company_id, :active, :time_from, :time_to, :name, :description, :mob_category_id, :stichworte, :geoaddress, :address1, :address2, :address3, :avatar

  # GET /vehicles
  def index
    @vehicles = Vehicle.search(params[:filter_id], params[:search]).page(params[:page]).per_page(10)
    @vehanz = @vehicles.count

    z = 0
    @hash = Gmaps4rails.build_markers(@vehicles) do |vehicle, marker|
      if vehicle.latitude != nil and vehicle.longitude != nil
        marker.lat vehicle.latitude
        marker.lng vehicle.longitude
        z=z+1
        marker.infowindow z.to_s+ " " + vehicle.name
#      marker.picture url: "http://images/ma_anonym.png"
      end
     end
  end

  # GET /vehicles/1
  def show
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
    if params[:user_id] != nil
      @vehicle.user_id = params[:user_id]
      @u = User.find(params[:user_id])
      if @u != nil
        @vehicle.address1 = @u.address1
        @vehicle.address2 = @u.address2
        @vehicle.address3 = @u.address3
      end
    end
    if params[:company_id] != nil
      @vehicle.company_id = params[:company_id]
      @c = Company.find(params[:company_id])
      if @c != nil
        @vehicle.address1 = @c.address1
        @vehicle.address2 = @c.address2
        @vehicle.address3 = @c.address3
      end
    end
    @vehicle.active = true
    @vehicle.status = "new"
  end

  # GET /vehicles/1/edit
  def edit
    @vehicle.status = "changed"
  end

  # POST /vehicles
  def create(vehicle)
    @vehicle = Vehicle.new(vehicle)

    if @vehicle.save
      redirect_to @vehicle, notice: 'Vehicle was successfully created.'
    else
      render :new
    end
  end

  # PUT /vehicles/1
  def update(vehicle)
    if @vehicle.update(vehicle)
      redirect_to @vehicle, notice: 'Vehicle was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /vehicles/1
  def destroy
    @vehicle.destroy

    redirect_to vehicles_path :page => session[:page], notice: 'Vehicle was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle(id)
      @vehicle = Vehicle.find(id)
    end
end
