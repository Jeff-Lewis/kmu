class AccessesController < ApplicationController
  before_action :set_access, only: [:show, :edit, :update, :destroy]
  permits :user_id, :workorder_id, :access, :costrate, :wo, :us

  @@wo_id = ""

  # GET /accesses
  def rights
  end
  
  def index
    if params[:wo] != nil
      @@wo_id = params[:wo]
    end
    str="workorder_id = " + @@wo_id
    @accesses = Access.where(str)
  end

  # GET /accesses/1
  def show
  end

  # GET /accesses/new
  def new
    @access = Access.new
    @access.user_id = params[:us]
    @access.workorder_id = $wo_id
    @access.costrate = 250
  end

  # GET /accesses/1/edit
  def edit
  end

  # POST /accesses
  def create(access)
    @access = Access.new(access)

    if @access.save
      redirect_to @access, notice: 'Access was successfully created.'
    else
      render :new
    end
  end

  # PUT /accesses/1
  def update(access)
    if @access.update(access)
      redirect_to @access, notice: 'Access was successfully updated.'
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
      params.require(:access).permit(:workorder_id, :user_id, :access, :costrate, :wo, :us)
    end

end