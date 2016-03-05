class WorkordersController < ApplicationController
  # before_action :set_workorder, only: [:show, :edit, :update, :destroy]

  def report
    array = []
    accesses = Access.where("user_id=?", params[:user_id])
    accesses.each do |ac|
      array << ac.workorder_id
    end
    @workorders = Workorder.where(:id => array)

#    @user = params[:user_name]

    if params[:reporting_date] != nil
      @reporting_date = params[:reporting_date]
      session[:rep] = params[:reporting_date]
    else
      @reporting_date = Date.today
    end
    @bom = @reporting_date.to_date.beginning_of_month
    @eom = @reporting_date.to_date.end_of_month
    @tt = Timetrack.where("user_id=? and tandm=? and datum >= ? and datum <= ?", current_user.id, "TIME", @bom, @eom)
    @hours_reported = @tt.sum(:amount)
  end
  
  def index
    

    @companies = Company.where("user_id=?", current_user.id)
    
    if @companies.count > 0

      if params[:company_id] != nil
        if params[:company_id] == "0" #'call ohne Company'
          @cid = @companies.first.id.to_s
        else
          @cid = params[:company_id]
        end
        session[:cid] = params[:company_id]
      else
        @cid = session[:cid]
      end
      if params[:parent_id] != nil
        @pid = params[:parent_id]
        session[:pid] = params[:parent_id]
      else
        @pid = session[:pid]
      end

      array = []
      rights = Right.where("company_id=?", @cid)
      rights.each do |ri|
        array << ri.user_id
      end
      @users = User.where(:id => array)
      
      puts "USER ANZ "+@users.count.to_s
      
      session[:users] = @users
      
      @workorders = Workorder.where("company_id=? and parent_id=?", @cid, @pid)
    else
      redirect_to companies_path(:userid => current_user.id), notice: 'You need to define a Company first!'
    end

  end

  # GET /workorders/1
  # GET /workorders/1.json
  def show
    set_workorder
  end

  # GET /workorders/new
  def new
    @users = session[:users]
    
    @workorder = Workorder.new
    @workorder.company_id = params[:company_id]
    @workorder.parent_id = params[:parent_id]
    @workorder.user_id = current_user.id
    @workorder.active = true
    @workorder.start_date = Date.today
    @workorder.end_date = Date.today.end_of_month
    
  end

  # GET /workorders/1/edit
  def edit
    @users = session[:users]
    set_workorder
  end

  # POST /workorders
  # POST /workorders.json
  def create
    @workorder = Workorder.new(workorder_params)

    # @users = session[:users]
    # @user_id = session[:user_id]

    respond_to do |format|
      if @workorder.save
        format.html { redirect_to workorders_path(:parent_id => session[:pid], :company_id => session[:cid]), notice: 'Workorder was successfully created.' }
        format.json { render :show, status: :created, location: @workorder }
      else
        format.html { render :new }
        format.json { render json: @workorder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workorders/1
  # PATCH/PUT /workorders/1.json
  def update
    set_workorder
    respond_to do |format|
      if @workorder.update(workorder_params)
        format.html { redirect_to workorders_path(:parent_id => session[:pid], :company_id => session[:cid]), notice: 'Workorder was successfully updated.' }
        format.json { render :show, status: :ok, location: @workorder }
      else
        format.html { render :edit }
        format.json { render json: @workorder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workorders/1
  # DELETE /workorders/1.json
  def destroy
    set_workorder
    @workorder.destroy
    respond_to do |format|
      format.html { redirect_to workorders_path(:parent_id => session[:pid], :company_id => session[:cid]), notice: 'Workorder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workorder
      @workorder = Workorder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workorder_params
      params.require(:workorder).permit(:company_id, :parent_id, :user_id, :active, :start_date, :end_date, :name, :description, :adress1, :adress2, :adress3, :phone1, :phone2, :costinfo1, :costinfo2, :budget, :avatar)
    end
end