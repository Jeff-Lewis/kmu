class DonationStatsController < ApplicationController
  before_action :set_donation_stat, only: [:show, :edit, :update, :destroy]
  permits :status, :donation_id, :user_id, :company_id, :amount, :anonymous

  # GET /donation_stats
  def index
    session[:donation_id] = params[:donation_id]
    @donation = Donation.find(params[:donation_id])
    @donation_stats = DonationStat.where("donation_id=?", session[:donation_id]).order(amount: :desc).page(params[:page]).per_page(10)
    @donanz = @donation_stats.count
  end

  # GET /donation_stats/1
  def show
  end

  # GET /donation_stats/new
  def new
    @donation_stat = DonationStat.new
    @donation_stat.donation_id = params[:donation_id]
    @donation_stat.amount = Donation.find(params[:donation_id]).price
    @dontype = params[:dontype]
    if params[:dontype] == "User"
        @donation_stat.user_id = current_user.id
    end
    @donation_stat.status = "new"
  end

  # GET /donation_stats/1/edit
  def edit
    @donation_stat.status = "changed"  
  end

  # POST /donation_stats
  def create(donation_stat)
    @donation_stat = DonationStat.new(donation_stat)

    if @donation_stat.save
      redirect_to @donation_stat.donation, notice: 'Donation stat was successfully created.'
    else
      render :new
    end
  end

  # PUT /donation_stats/1
  def update(donation_stat)
    if @donation_stat.update(donation_stat)
      redirect_to @donation_stat.donation, notice: 'Donation stat was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /donation_stats/1
  def destroy
    @donation_stat.destroy

    redirect_to @donation_stat.donation, notice: 'Donation stat was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation_stat(id)
      @donation_stat = DonationStat.find(id)
    end
end
