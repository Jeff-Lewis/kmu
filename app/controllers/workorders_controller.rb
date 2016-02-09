class WorkordersController < ApplicationController
  # before_action :set_workorder, only: [:show, :edit, :update, :destroy]

# Parameter
# :parent_id 
# :user_id 
# :mode => "bookable" or "admin" - nach Access oder Adminrechte selectieren)

  $current_parent_id = 0
  $wo_hierachy = []

  # GET /workorders
  # GET /workorders.json
  
  def show_user_workorders
    array = []
    accesses = Access.where("user_id=?", params[:user_id])
    accesses.each do |ac|
      array << ac.workorder_id
    end
    @workorders = Workorder.where(:id => array)
    @user = params[:user_name]
  end
  
  def report
    array = []
    accesses = Access.where("user_id=?", params[:user_id])
    accesses.each do |ac|
      array << ac.workorder_id
    end
    @workorders = Workorder.where(:id => array)
    @user = params[:user_name]
    @report_date = $booking_date
  end
  
  def set_booking_date
    $booking_date = params[:report_date]
    puts $booking_date
    @report_date = $booking_date
    redirect_to workorders_report_path(:user_id => $logon_user_id)
  end
  
  def index
    @workorders = Workorder.where("parent_id=?", params[:parent_id]).name
    $current_parent_id = params[:parent_id]
    @workorders = Workorder.all
  end

  # GET /workorders/1
  # GET /workorders/1.json
  def show
    set_workorder
  end

  # GET /workorders/new
  def new
    @workorder = Workorder.new
    @workorder.parent_id = params[:parent_id]
    @workorder.active = true
    @workorder.user_id = $current_user_id
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
        format.html { redirect_to @workorder, notice: 'Workorder was successfully created.' }
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
        format.html { redirect_to @workorder, notice: 'Workorder was successfully updated.' }
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
      format.html { redirect_to workorders_url, notice: 'Workorder was successfully destroyed.' }
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
      params.require(:workorder).permit(:parent_id, :user_id, :active, :name, :description, :adress1, :adress2, :adress3, :phone1, :phone2, :costonfo1, :costinfo2, :avatar)
    end
end