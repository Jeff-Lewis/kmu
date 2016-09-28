class ServicesController < ApplicationController
      before_action :set_service, only: [:show, :edit, :update, :destroy]
      permits :stichworte, :status, :company_id, :parent_id, :user_id, :active, :stype, :date_from, :date_to, :price_reg, :price_new, :name, :description, :social, :ansprechpartner, :telefon, :email, :avatar

  def index
    if params[:page]
      session[:page] = params[:page]
    end
    if params[:stype] != nil
      session[:stype] = params[:stype]
    end
    @stype = session[:stype]
    @services = Service.search(params[:cw], params[:year], session[:stype], params[:filter_id], params[:search]).order(created_at: :desc).page(params[:page]).per_page(16)
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

  # GET /workorders/1
  # GET /workorders/1.json
  def show
    if params[:topic]
      @topic = params[:topic]
    else
      @topic = "Service"
    end
  end

  # GET /workorders/new
  def new
    @service = Service.new
    @service.stype = params[:stype]
    if params[:user_id] != nil
      @service.user_id = params[:user_id]
    end
    if params[:company_id] != nil
      @service.company_id = params[:company_id]
      @service.date_from = DateTime.now
      @service.date_to = DateTime.now.to_date.end_of_month
    end
    @service.parent_id = 0
    @service.social = false
    @service.active = true
    @service.status = "new"
    
  end

  # GET /workorders/1/edit
  def edit
    @service.status = "changed"
  end

  # POST /workorders
  # POST /workorders.json
  def create(service)
    @service = Service.new(service)
    if @service.save
      if @service.company_id != nil
          redirect_to company_path(:id => @service.company, :topic => "Service"), notice: 'service was successfully created.'
      end
      if @service.user_id != nil
          redirect_to user_path(:id => @service.user, :topic => "Service"), notice: 'service was successfully created.'
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update(service)
    if @service.update(service)
      if @service.company_id != nil
          redirect_to @service.company, notice: 'service was successfully updated.'
      end
      if @service.user_id != nil
          redirect_to @service.user, notice: 'service was successfully updated.'
      end
    end
  end

  # DELETE /workorders/1
  # DELETE /workorders/1.json
  def destroy
    if @service.company_id
      @comp = @service.company_id
    end
    if @service.user_id
      @us = @service.user_id
    end
    @service.destroy
    if @comp
        redirect_to company_path(:id => @comp, :topic => "Service"), notice: 'service was successfully created.'
    end
    if @us
        redirect_to user_path(:id => @us, :topic => "Service"), notice: 'service was successfully created.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service(id)
      @service = Service.find(id)
    end

end
