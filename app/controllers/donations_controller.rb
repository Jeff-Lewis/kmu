class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]
  permits :days,:status, :name, :description, :company_id, :amount, :active, :stichworte

  # GET /donations
  def index
    session[:page] = params[:page]
    if params[:sql_string] != nil
      @donations = Donation.paginate_by_sql(params[:sql_string], :page => params[:page], :per_page => 10)
    else
      @donations = Donation.search(params[:search]).order(created_at: :desc).page(params[:page]).per_page(10)
    end
    @donanz = @donations.count
  end

  # GET /donations/1
  def show
  end

  # GET /donations/new
  def new
    @donation = Donation.new
    @donation.company_id = params[:company_id]
    @donation.amount = 0
    @donation.active = true
    @donation.status = "new"
  end

  # GET /donations/1/edit
  def edit
    @donation.status = "changed"
  end

  # POST /donations
  def create(donation)
    @donation = Donation.new(donation)

    if @donation.save
      redirect_to donations_path :page => session[:page], notice: 'Donation was successfully created.'
    else
      render :new
    end
  end

  # PUT /donations/1
  def update(donation)
    if @donation.update(donation)
      redirect_to donations_path :page => session[:page], notice: 'Donation was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /donations/1
  def destroy
    @donation.destroy

    redirect_to donations_path :page => session[:page], notice: 'Donation was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation(id)
      @donation = Donation.find(id)
    end
end
