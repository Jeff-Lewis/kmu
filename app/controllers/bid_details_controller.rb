class BidDetailsController < ApplicationController
  before_action :set_bid_detail, only: [:show, :edit, :update, :destroy]
  permits :status, :bid_id, :name, :description, :avatar

  # GET /bid_details
  def index
    if params[:bid_id]
      session[:bid_id] = params[:bid_id]
    end
    @bid_details = BidDetail.where('bid_id=?',session[:bid_id])
    @bid = Bid.find(params[:bid_id])
  end

  # GET /bid_details/1
  def show
  end

  # GET /bid_details/new
  def new
    @bid_detail = BidDetail.new
    @bid_detail.bid_id = params[:bid_id]
    @bid_detail.status = "new"
  end

  # GET /bid_details/1/edit
  def edit
    @bid_detail.status = "changed"
  end

  # POST /bid_details
  def create(bid_detail)
    @bid_detail = BidDetail.new(bid_detail)

    if @bid_detail.save
      redirect_to @bid_detail.bid, notice: 'Bid detail was successfully created.'
    else
      render :new
    end
  end

  # PUT /bid_details/1
  def update(bid_detail)
    if @bid_detail.update(bid_detail)
      redirect_to @bid_detail.bid, notice: 'Bid detail was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bid_details/1
  def destroy
    @bid_detail.destroy

    redirect_to @bid_detail.bid, notice: 'Bid detail was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid_detail(id)
      @bid_detail = BidDetail.find(id)
    end
end
