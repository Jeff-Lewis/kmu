class AccessesController < ApplicationController
  before_action :set_access, only: [:show, :edit, :update, :destroy]
  permits :user_id, :workorder_id, :access, :costrate

  # GET /rights
  def index
    # @suchfeld = ""
    puts params[:suchfeld]
    if params[:suchfeld] != nil
      @users = User.where('lastname LIKE ?', params[:suchfeld]).order(:name)
      @suchfeld = params[:suchfeld]
    else
      @users = User.all.order(:name)
    end

    if params[:workorder_id] != nil
      @wid = params[:workorder_id]
      session[:wid] = params[:workorder_id]
    else
      @wid = session[:wid]
    end
    
    # to check whether user has access
    accesses = Access.where("workorder_id=?", @wid)
    @array = []
    @array_id = []
    accesses.each do |ac|
        @array << ac.user_id
        @array_id << ac.id
    end
  end

  # GET /rights/1
  def show
  end

  # GET /rights/new
  def new
    @access = Access.new
    @access.user_id = params[:user_id].to_i
    @access.workorder_id = params[:workorder_id].to_i
    @access.costrate = User.find(params[:user_id]).costrate
  end

  # GET /rights/1/edit
  def edit
  end

  # POST /rights
  def create(access)
    @access = Access.new(access)

    if @access.save
      redirect_to accesses_path(:workorder_id => session[:wid]), notice: 'Right was successfully created.'
    else
      render :new
    end
  end

  # PUT /rights/1
  def update(access)
    if @access.update(access)
      redirect_to accesses_path(:workorder_id => session[:wid]), notice: 'Right was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /rights/1
  def destroy
    @access.destroy

    redirect_to accesses_path(:workorder_id => session[:wid]), notice: 'Right was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_access(id)
      @access = Access.find(id)
    end
end
