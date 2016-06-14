class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  permits :status, :rtype, :active, :price, :user_id, :name, :description, :social, :date_from, :date_to

  # GET /requests
  def index
    if params[:rtype]
      session[:rtype] = params[:rtype]
    end 
    if params[:sql_string] != nil
      @requests = Request.paginate_by_sql(params[:sql_string], :page => params[:page], :per_page => 10)
    else
      @requests = Request.search(params[:search],session[:rtype]).order(created_at: :desc).page(params[:page]).per_page(10)
    end
    @reqanz = @requests.count
  end
  
  # GET /requests/1
  def show
    if params[:rtype]
      session[:rtype] = params[:rtype]
    end 
  end

  # GET /requests/new
  def new
    @request = Request.new
    @request.rtype = params[:rtype]
    @request.user_id = current_user.id
    @request.active = true
    @request.status = "new"
    @request.date_from = Date.today
    @request.date_to = Date.today + 10
  end

  # GET /requests/1/edit
  def edit
    @request.status = "changed"
  end

  # POST /requests
  def create(request)
    @request = Request.new(request)

    if @request.save
      redirect_to @request, notice: 'Request was successfully created.'
    else
      render :new
    end
  end

  # PUT /requests/1
  def update(request)
    if @request.update(request)
      redirect_to @request, notice: 'Request was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /requests/1
  def destroy
    @request.destroy
    redirect_to requests_path :page => session[:page], :rtype => session[:rtype], notice: 'Request was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request(id)
      @request = Request.find(id)
    end
end
