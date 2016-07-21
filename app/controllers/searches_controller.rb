class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]
  permits :ticket_id, :rtype, :date_from, :date_to, :search_domain, :controller, :user_id, :name, :description, :status, :category_id, :mob_category_id, :hs_category_id, :ev_category_id, :keywords, :age_from, :age_to, :distance, :geo_address, :address1, :address2, :address3, :date_created_at, :rating, :social, :customer, :amount_from, :amount_to, :amount_from_target, :amount_to_target, :special, :rating

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
    if params[:ticket_id]
      @ticket = Ticket.find(params[:ticket_id])
      session[:sponsor_id] = @ticket.sponsor_id
      session[:ticket_id] = @ticket.id
      @searches = Search.where('ticket_id=?', params[:ticket_id]).page(params[:page]).per_page(10)

      if params[:generate]
        userticket = UserTicket.where('ticket_id=? and status=?', session[:ticket_id], "Filter Kampagne").destroy_all
        @searches.each do |s|
          @users = User.where(s.sql_string)
          @users.each do |u|
            if UserTicket.where('user_id=? and ticket_id=?', u.id, session[:ticket_id]).count == 0
              userticket = UserTicket.new
              userticket.user_id = u.id
              userticket.ticket_id = params[:ticket_id]
              userticket.status = "Filter Kampagne"
              userticket.save
            end
          end
        end
      end

      if params[:activate]
        @usertickets = UserTicket.where('ticket_id=? and status=?', session[:ticket_id], "Filter Kampagne")
        @usertickets.each do |ut|
          ut.status = "übergeben"
          ut.save
        end
      end

    else
      @searches = Search.where('search_domain=? and user_id=?', params[:search_domain], current_user.id).page(params[:page]).per_page(10)
      session[:sponsor_id] = nil
      session[:ticket_id] = nil
    end
    @seranz = @searches.count
    
  end

  # GET /searches/1
  def show
  end

  # GET /searches/new
  def new
    @search = Search.new
    @search.sql_string = []
    @search.search_domain = params[:search_domain]
    @search.user_id = params[:user_id]
    @search.controller = params[:controller_name]
    @search.distance = 0
    if params[:ticket_id] != nil
      @ticket = Ticket.find(params[:ticket_id])
      @search.ticket_id = @ticket.id
      @search.name = @ticket.sponsor.event.name + " Umkreissuche" 
      @search.longitude = @ticket.sponsor.event.longitude
      @search.latitude= @ticket.sponsor.event.latitude
      @search.address1 = @ticket.sponsor.event.address1
      @search.address2 = @ticket.sponsor.event.address2
      @search.address3 = @ticket.sponsor.event.address3
      @search.distance = 10
    else
      session[:ticket_id] = nil
      @search.longitude = request.location.longitude
      @search.latitude= request.location.latitude
    end
  end

  # GET /searches/1/edit
  def edit
  end

  # POST /searches
  def create(search)
    @search = Search.new(search)
    if @search.save
      if params[:commit] == "Speichern"
        redirect_to searches_path(:user_id => current_user.id, :page => session[:page], :search_domain => @search.search_domain, :controller_name => @search.controller, :ticket_id => @search.ticket_id), notice: 'Search was successfully updated.'
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
        redirect_to searches_path(:user_id => current_user.id, :page => session[:page], :search_domain => @search.search_domain, :controller_name => @search.controller, :ticket_id => @search.ticket_id), notice: 'Search was successfully updated.'
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
    if @search.ticket_id
      ticket_id = @search.ticket_id
    else
      ticket_id = nil
    end
    @search.destroy
    redirect_to searches_path(:user_id => current_user.id, :page => session[:page], :search_domain => @search.search_domain, :controller_name => @search.controller, :ticket_id => ticket_id), notice: 'Search was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search(id)
      @search = Search.find(id)
      @count = @search.build_sql if (action_name != "destroy")
      @search.counter = @count
    end
end
