class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]
  permits :rtype, :date_from, :date_to, :search_domain, :controller, :user_id, :name, :description, :status, :category_id, :mob_category_id, :hs_category_id, :ev_category_id, :keywords, :age_from, :age_to, :distance, :geo_address, :address1, :address2, :address3, :date_created_at, :rating, :social, :amount_from, :amount_to, :amount_from_target, :amount_to_target, :special, :rating

  # GET /searches
  def index
    if params[:search_domain]
      @search_domain = params[:search_domain]
    end
    if params[:controller_name]
      @controller_name = params[:controller_name]
    end
    if params[:page]
      session[:page] = params[:page]
    end
    $search_domain_ext = %w[Privatpersonen Institutionen Ausschreibungen Angebote Mobilien Kleinanzeigen Stellenanzeigen Veranstaltungen Sehenswuerdigkeiten Spendeninitiativen]
    $search_domain_int = %w[users companies bids services vehicles requests jobs events hotspots donations]
    $domain = [{"name" => "Privatpersonen", "id" => "users"}, {"name" => "Institutionen", "id" => "companies"}, {"name" => "Ausschreibungen", "id" => "bids"}, {"name" => "Angebote", "id"=> "services"}, {"name" => "Mobilien", "id" => "vehicles"}, {"name" => "Kleinanzeigen", "id" => "requests"}, {"name" => "Stellenanzeigen", "id" => "jobs"}, {"name" => "Veranstaltungen", "id" => "events"}, {"name" => "Sehenswuerdigkeiten", "id" => "hotspots"}, {"name" => "Spendeninitiativen", "id" => "donations"}]
    @searches = Search.where('search_domain=? and user_id=?', params[:search_domain], current_user.id).page(params[:page]).per_page(10)
    @seranz = @searches.count
  end

  # GET /searches/1
  def show
  end

  #  # GET /searches/1/call
  def call
    redirect_to users_path
  end

  # GET /searches/new
  def new
    @search = Search.new
    @search.search_domain = params[:search_domain]
    @search.user_id = params[:user_id]
    @search.controller = params[:controller_name]
    @current_longitude = request.location.longitude
    @current_latitude= request.location.latitude
  end

  # GET /searches/1/edit
  def edit
  end

  # POST /searches
  def create(search)
    @search = Search.new(search)
    if @search.save
      if params[:commit] == "Speichern"
        redirect_to searches_path(:user_id => current_user.id, :page => session[:page], :search_domain => @search.search_domain, :controller_name => @search.controller), notice: 'Search was successfully updated.'
      end
      if params[:commit] == "Test"
        redirect_to edit_search_path(@search), notice: 'Search successfully tested.'
      end
      if params[:commit] == nil
        redirect_to edit_search_path(@search), notice: 'Search successfully tested.'
      end
    else
      render :new
    end
  end

  # PUT /searches/1
  def update(search)
    if @search.update(search)
      if params[:commit] == "Speichern"
        redirect_to searches_path(:user_id => current_user.id, :page => session[:page], :search_domain => @search.search_domain, :controller_name => @search.controller), notice: 'Search was successfully updated.'
      end
      if params[:commit] == "Test"
        redirect_to edit_search_path(@search), notice: 'Search successfully tested.'
      end
      if params[:commit] == nil
        redirect_to edit_search_path(@search), notice: 'Search successfully tested.'
      end
    else
      render :edit
    end
  end

  # DELETE /searches/1
  def destroy
    @search.destroy

    redirect_to searches_url, notice: 'Search was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search(id)
      @search = Search.find(id)
      @count = @search.build_sql
    end
end
