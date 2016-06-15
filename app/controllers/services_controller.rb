class ServicesController < ApplicationController
      before_action :set_service, only: [:show, :edit, :update, :destroy]
      permits :stichworte, :status, :company_id, :parent_id, :user_id, :active, :stype, :date_from, :date_to, :price_reg, :price_new, :name, :description, :social, :ansprechpartner, :telefon, :email, :avatar

  def index
      if params[:page] != nil
        session[:page] = params[:page]
      end
      if params[:mode] != nil
        session[:mode] = params[:mode]
      end
      if params[:stype] != nil
        session[:stype] = params[:stype]
      end
      if params[:company_id] != nil
        @company_id = params[:company_id]
        session[:company_id] = params[:company_id]
        @services = Service.where("company_id=? and parent_id=? and stype=?", params[:company_id], 0, params[:stype])
      end
      if params[:user_id] != nil
        @user_id = params[:user_id]
        session[:user_id] = params[:user_id]
        @services = Service.where("user_id=? and parent_id=?", params[:user_id], 0)
      end
  end

  # GET /workorders/1
  # GET /workorders/1.json
  def show
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
          redirect_to @service.company, notice: 'service was successfully created.'
      end
      if @service.user_id != nil
          redirect_to @service.user, notice: 'service was successfully created.'
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
    back1 = @service.company_id
    back2 = @service.user_id
    @service.destroy
    if back1 != nil
        redirect_to @service.company, notice: 'service was successfully destroyed.'
    end
    if back2 != nil
        redirect_to @service.user, notice: 'service was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service(id)
      @service = Service.find(id)
    end

end
