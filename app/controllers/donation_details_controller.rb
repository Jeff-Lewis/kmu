class DonationDetailsController < ApplicationController
  before_action :set_donation_detail, only: [:show, :edit, :update, :destroy]
  permits :status, :donation_id, :name, :description, :avatar

  # GET /donation_details
  def index
    session[:donation_id] = params[:donation_id]
    @donation = Donation.find(params[:donation_id])
    @donation_details = DonationDetail.where("donation_id=?", session[:donation_id])
    @donanz = @donation_details.count
  end

  # GET /donation_details/1
  def show
  end

  # GET /donation_details/new
  def new
    @donation_detail = DonationDetail.new
    if params[:donation_id] != nil 
      @donation_detail.donation_id = params[:donation_id]
      session[:donation_id] = params[:donation_id]
    else
      @donation_detail.donation_id = session[:donation_id].to_i
    end
    @donation_detail.status = "new"
  end

  # GET /donation_details/1/edit
  def edit
    @donation_detail.status = "changed"
  end

  # POST /donation_details
  def create(donation_detail)
    @donation_detail = DonationDetail.new(donation_detail)

    if @donation_detail.save
      redirect_to @donation_detail.donation :donation_id => session[:donation_id], notice: 'Donation detail was successfully created.'
    else
      render :new
    end
  end

  # PUT /donation_details/1
  def update(donation_detail)
    if @donation_detail.update(donation_detail)
      redirect_to @donation_detail.donation :donation_id => session[:donation_id], notice: 'Donation detail was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /donation_details/1
  def destroy
    @d = @donation_detail.donation
    @donation_detail.destroy
    redirect_to @d, :donation_id => session[:donation_id], notice: 'Donation detail was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation_detail(id)
      @donation_detail = DonationDetail.find(id)
    end
end
