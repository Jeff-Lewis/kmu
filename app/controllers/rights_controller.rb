class RightsController < ApplicationController
  before_action :set_right, only: [:show, :edit, :update, :destroy]
  permits :company_id, :user_id, :superuser

  # GET /rights
  def index
    if params[:suchfeld] != nil
      @users = User.where('lastname LIKE ?', params[:suchfeld]).order(:name)
      @suchfeld = params[:suchfeld]
    else
      @users = User.all.order(:name)
    end

    if params[:company_id] != nil
      @cid = params[:company_id]
      session[:cid] = params[:company_id]
    else
      @cid = session[:cid]
    end
    
    # to check whether user has right
    rights = Right.where("company_id=?", @cid)
    @array = []
    @array_id = []
    rights.each do |r|
        @array << r.user_id
        @array_id << r.id
    end
  end

  # GET /rights/1
  def show
  end

  # GET /rights/new
  def new
    @right = Right.new
    @right.user_id = params[:user_id].to_i
    @right.company_id = params[:company_id].to_i
  end

  # GET /rights/1/edit
  def edit
  end

  # POST /rights
  def create(right)
    @right = Right.new(right)

    if @right.save
      redirect_to rights_path(:company_id => session[:cid]), notice: 'Right was successfully created.'
    else
      render :new
    end
  end

  # PUT /rights/1
  def update(right)
    if @right.update(right)
      redirect_to rights_path(:company_id => session[:cid]), notice: 'Right was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /rights/1
  def destroy
    @right.destroy

    redirect_to rights_path(:company_id => session[:cid]), notice: 'Right was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_right(id)
      @right = Right.find(id)
    end
end
