class ServicesController < ApplicationController
      # before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
      if params[:mode] != nil
        session[:mode] = params[:mode]
      end
      if params[:mode] == "company"
        @services = Service.where("company_id=? and parent_id=?", params[:company_id], 0)
        @company_id = params[:company_id]
        session[:company_id] = params[:company_id]
      end
      if params[:mode] == "private"
        @services = Service.where("user_id=? and parent_id=?", params[:user_id], 0)
        @user_id = params[:user_id]
        session[:user_id] = params[:user_id]
      end
  end

  # GET /workorders/1
  # GET /workorders/1.json
  def show
    set_service
  end

  # GET /workorders/new
  def new
    @service = Service.new
    if session[:mode] == "company"
      @service.company_id = session[:company_id]
    end
    if session[:mode] == "private"
      @service.user_id = session[:user_id]
      puts "new Service for User" + session[:user_id].to_s
    end
    @service.parent_id = 0
    @service.free = true
    set_object
    
  end

  # GET /workorders/1/edit
  def edit
    set_service
    set_object
  end

  # POST /workorders
  # POST /workorders.json
  def create
    @service = Service.new(service_params)
    set_object
    respond_to do |format|
      if @service.save
        if session[:mode] == "company"
          format.html { redirect_to services_path(:mode => "company", :company_id => session[:company_id]), notice: 'Service was successfully created.' }
        end
        if session[:mode] == "private"
          format.html { redirect_to services_path(:mode => "private", :user_id => session[:user_id]), notice: 'Service was successfully created.' }
        end
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    set_service
    set_object
    respond_to do |format|
      if @service.update(service_params)
        if session[:mode] == "company"
          format.html { redirect_to services_path(:mode => "company", :company_id => session[:company_id]), notice: 'Service was successfully updated.' }
        end
        if session[:mode] == "private"
          format.html { redirect_to services_path(:mode => "private", :user_id => session[:user_id]), notice: 'Service was successfully updated.' }
        end
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workorders/1
  # DELETE /workorders/1.json
  def destroy
    set_service
    @service.destroy
    respond_to do |format|
        if session[:mode] == "company"
          format.html { redirect_to services_path(:mode => "company", :company_id => session[:company_id]), notice: 'service was successfully destroyed.' }
        end
        if session[:mode] == "private"
          format.html { redirect_to services_path(:mode => "private", :user_id => session[:user_id]), notice: 'service was successfully destroyed.' }
        end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:company_id, :parent_id, :user_id, :name, :description, :free, :ansprechpartner, :telefon, :email, :avatar)
    end
    
    def set_object
      if session[:mode] == "company"
        @company_id = session[:company_id]
      end
      if session[:mode] == "private"
        @user_id = session[:user_id]
      end
    end
    
end
