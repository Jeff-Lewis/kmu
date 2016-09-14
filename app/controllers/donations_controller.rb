class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]
  permits :date_from, :date_to, :due_date, :interest_rate, :days,:status, :name, :description, :user_id, :company_id, :amount, :active, :stichworte, :dtype, :price, :reward

  # GET /donations
  def index
    session[:page] = params[:page]
    @donations = Donation.search(params[:filter_id], params[:search], params[:dtype]).order(created_at: :desc).page(params[:page]).per_page(10)
    @donanz = @donations.count
    @dtype = params[:dtype]
  end

  # GET /donations/1
  def show
    
    @donstats = DonationStat.select("date(created_at) as datum, sum(amount) as summe").where('donation_id = ?', @donation.id).group("date(created_at)")
    
    puts @donation.to_s
    
    if params[:donation_trx_id]
      @donation = Donation.find(params[:donation_trx_id])
      @donation.donation_stats.each do |ds|

        @trx = Transaction.new
        @trx.ttype = "Payment"
        @trx.user_id = ds.user_id
        @trx.company_id = ds.company_id
        @trx.account_bel = getKonto(ds.user_id, ds.company_id, "Belastung")
        @trx.account_ver = getKonto(ds.donation.user_id, ds.donation.company_id, "Verguetung")
        @trx.trx_date = Date.today 
        @trx.valuta = Date.today+1
        @trx.status = "erfasst"
        @trx.active = true
        @trx.object_name = "Donation"
        @trx.object_id = @donation.id
        @trx.ref =
        @trx.text = 
        @trx.amount = ds.amount
        if @trx.account_bel and @trx.account_ver
          @trx.save
        end

      end
    end
    
  end

  # GET /donations/new
  def new
    @donation = Donation.new
    if params[:dtype]
      @donation.dtype = params[:dtype]
    end
    if params[:company_id]
      @donation.company_id = params[:company_id]
    end
    if params[:user_id]
      @donation.user_id = params[:user_id]
    end
    @donation.amount = 0
    @donation.price = 0
    @donation.interest_rate = 0
    @donation.active = true
    @donation.status = "new"
    @donation.date_from = Date.today
    @donation.date_to = Date.today + 90
    @donation.due_date = @donation.date_to + 365
  end

  # GET /donations/1/edit
  def edit
    @donation.status = "changed"
  end

  # POST /donations
  def create(donation)
    @donation = Donation.new(donation)

    if @donation.save
      redirect_to @donation, :page => session[:page], notice: 'Donation was successfully created.'
    else
      render :new
    end
  end

  # PUT /donations/1
  def update(donation)
    if @donation.update(donation)
      redirect_to @donation, :page => session[:page], notice: 'Donation was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /donations/1
  def destroy
    @dtype = @donation.dtype
    @donation.destroy
    redirect_to donations_path :dtype => @dtype, :page => session[:page], notice: 'Donation was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation(id)
      @donation = Donation.find(id)
    end
    
    def getKonto(user_id, company_id, type)
    
    if user_id
      @user = User.find(user_id)
      @ali = []
      @partners = Company.where('partner=?',true)
      @partners.each do |p|
        @customer = Customer.where("user_id=? AND partner_id=?", user_id, p.id).first
        if @customer
          case type
            when "Belastung"
              @customer.accounts.each do |ca|
                @ali << ca.id
              end
            when "Verguetung"
              @customer.accounts.where('is_account_ver=?',true).each do |ca|
                @ali << ca.id
              end
          end
        end
      end
    end
    
    if company_id
      @company = Company.find(company_id)
      @ali = []
      @partners = Company.where('partner=?',true)
      @partners.each do |p|
        @customer = Customer.where("company_id=? AND partner_id=?", company_id, p.id).first
        if @customer
          case type
            when "Belastung"
              @customer.accounts.each do |ca|
                @ali << ca.id
              end
            when "Verguetung"
              @customer.accounts.where('is_account_ver=?',true).each do |ca|
                @ali << ca.id
              end
          end
        end
      end
    end
    
    puts type + " " + @ali.to_s
    return @ali[0]
  end

end
