class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :edit, :update, :destroy]
  permits :status, :user_id, :category_id, :name, :date_from, :date_to, :description, :active, :asap, :geo_address, :address1, :address2, :address3, :latitude, :longitude

#  $wochentage = %w[Montag Dienstag Mittwoch Donnerstag Freitag Samstag Sonntag]

  # GET /bids
  def index
    if params[:page]
      session[:page] = params[:page]
    end
    @bids = Bid.search(session[:cw], session[:year], params[:filter_id], params[:search]).order(date_from: :asc).page(params[:page]).per_page(10)
    @bidanz = @bids.count
  
    z = 0
    @hash = Gmaps4rails.build_markers(@bids) do |bid, marker|
      if bid.latitude != nil and bid.longitude != nil
        marker.lat bid.latitude
        marker.lng bid.longitude
        z=z+1
        marker.infowindow z.to_s+ " " + bid.name
      end
     end
  end

  # GET /bids/1
  def show
  end

  # GET /bids/new
  def new
    @bid = Bid.new
    @bid.user_id = params[:user_id]
    @bid.address1 = current_user.address1
    @bid.address2 = current_user.address2
    @bid.address3 = current_user.address3
    @bid.date_from = Date.today
    @bid.date_to = Date.today
    @bid.active = true
    @bid.asap = true
    @bid.status = "new"    
  end

  # GET /bids/1/edit
  def edit
    @bid.status = "changed"
  end

  # POST /bids
  def create(bid)
    @bid = Bid.new(bid)
    if @bid.save
      redirect_to @bid, notice: 'Bid was successfully created.'
    else
      render :new
    end
  end

  # PUT /bids/1
  def update(bid)
    if @bid.update(bid)
      redirect_to @bid, notice: 'Bid was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bids/1
  def destroy
    @user = @bid.user
    @bid.destroy
    redirect_to @user, notice: 'Bid was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid(id)
      @bid = Bid.find(id)
    end
end
