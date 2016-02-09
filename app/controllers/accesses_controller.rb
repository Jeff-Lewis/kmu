class AccessesController < ApplicationController
  before_action :set_access, only: [:show, :edit, :update, :destroy]
  permits :user_id, :workorder_id, :access, :costrate

  $workorder_id =""
  $workorder_name = ""

  # GET /accesses
  def rights
  end
  
  def index
    @accesses = Access.where("workorder_id=?",params[:workorder_id])
    $workorder_id = params[:workorder_id]
    $workorder_name = params[:workorder_name]
  end

  # GET /accesses/1
  def show
  end

  # GET /accesses/new
  def new
    @access = Access.new
    @access.user_id = params[:user_id]
    @access.workorder_id = $workorder_id
    @access.costrate = 100
  end

  # GET /accesses/1/edit
  def edit
  end

  # POST /accesses
  def create(access)
    @access = Access.new(access)
    if @access.save
      redirect_to accesses_path(:workorder_id => $workorder_id, :workorder_name => $workorder_name), notice: 'Access was successfully created.'
    else
      render :new
    end
  end

  # PUT /accesses/1
  def update(access)
    if @access.update(access)
      redirect_to accesses_path(:workorder_id => $workorder_id, :workorder_name => $workorder_name), notice: 'Access was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /accesses/1
  def destroy
    @access.destroy
    redirect_to accesses_path, notice: 'Access was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_access(id)
      @access = Access.find(id)
    end

    def user_params
      params.require(:access).permit(:workorder_id, :user_id, :access, :costrate)
    end

end