class WorkordersController < ApplicationController
  before_action :set_workorder, only: [:show, :edit, :update, :destroy]

  # GET /workorders
  # GET /workorders.json
  def index
    if params[:mode] = "bookable"
      #only bookable workorders in @workorders
      @access = Access.where("user_id="+params[:id])
      if @access.count > 0
         bookable_wo = []
         @access.each do |a|
           bookable_wo.<< a.workorder_id
         end
      end 
      @workorders = Workorder.where(:id => bookable_wo)
    else
      #only workorders of selected subproject
      @workorders = Workorder.all
    end
    sqlstring = "            SELECT projects.name AS projectname, subprojects.name AS subprojectname, workorders.* FROM workorders, subprojects, projects "
    sqlstring = sqlstring + "WHERE workorders.subproject_id = subprojects.id AND "
    sqlstring = sqlstring + "      subprojects.project_id = projects.id "
    sqlstring = sqlstring + ""
    sqlstring = sqlstring + "ORDER BY projects.name, subprojects.name, workorders.name "
    @workorders = Workorder.find_by_sql(sqlstring)
  end

  # GET /workorders/1
  # GET /workorders/1.json
  def show
  end

  # GET /workorders/new
  def new
    @workorder = Workorder.new
  end

  # GET /workorders/1/edit
  def edit
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
      params.require(:workorder).permit(:subproject_id, :user_id, :name, :description)
    end
end