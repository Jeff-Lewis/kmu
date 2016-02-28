class WorkordersController < ApplicationController
  # before_action :set_workorder, only: [:show, :edit, :update, :destroy]

  $current_parent_id = 0
  $current_company_id = nil
  $def_date = Date.today
  $bom = ""
  $eom = ""
  $hours_reported = 0
  # $wo_hierachy = []

  def init
    array = []
    accesses = Access.where("user_id=?", params[:user_id])
    accesses.each do |ac|
      array << ac.workorder_id
    end
    @workorders = Workorder.where(:id => array)
    @user = params[:user_name]
  end

  # GET /workorders
  # GET /workorders.json
  def show_user_workorders
    init
  end
  
  def report
    init
    $bom = $def_date.to_date.beginning_of_month
    $eom = $def_date.to_date.end_of_month
    @tt = Timetrack.where("user_id=? and tandm=? and datum >= ? and datum <= ?", $logon_user_id, "TIME", $bom, $eom)
    $hours_reported = @tt.sum(:amount)
  end
  
  def set_company
    $current_company_id = params[:company_id]
    puts "ACHTUNGS::::::" + params[:company_id].to_s
    redirect_to workorders_path(:parent_id => 0)
  end
  
  def set_booking_date
    $def_date = params[:reporting_date]
    redirect_to workorders_report_path(:user_id => $logon_user_id)
  end
  
  def index
    
    puts "PARENT ----> " + params[:parent_id].to_s
    puts "COMPAN ----> " + params[:company_id].to_s
    
    if params[:parent_id] != 0
      $current_parent_id = params[:parent_id]
    end
    if params[:company_id] != nil
      $current_company_id = params[:company_id]
    end
    @workorders = Workorder.where("parent_id=?", $current_parent_id).order(:company_id)
    @comps = Company.where("user_id=?", $logon_user_id)
  end

  # GET /workorders/1
  # GET /workorders/1.json
  def show
    set_workorder
  end

  # GET /workorders/new
  def new
    @workorder = Workorder.new
    @workorder.company_id = params[:company_id]
    @workorder.parent_id = params[:parent_id]
    @workorder.user_id = $current_user_id
    @workorder.active = true
  end

  # GET /workorders/1/edit
  def edit
    set_workorder
  end

  # POST /workorders
  # POST /workorders.json
  def create
    @workorder = Workorder.new(workorder_params)

    respond_to do |format|
      if @workorder.save
        format.html { redirect_to workorders_path(:parent_id => $current_parent_id, :company_id => $current_company_id), notice: 'Workorder was successfully created.' }
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
        format.html { redirect_to workorders_path(:parent_id => $current_parent_id, :company_id => $current_company_id), notice: 'Workorder was successfully updated.' }
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
      format.html { redirect_to workorders_path(:parent_id => $current_parent_id, :company_id => $current_company_id), notice: 'Workorder was successfully destroyed.' }
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