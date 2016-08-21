class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  permits :customer_id, :company_id, :iban, :is_account_ver, :name

  # GET /accounts
  def index
    @accounts = Account.where('customer_id=?', params[:customer_id])
    @accanz = @accounts.count
    @customer = Customer.find(params[:customer_id])
    if @customer.user_id 
      @item = User.find(@customer.user_id)
      @header = @item.name + " " + @item.lastname
    else
      @item = Company.find(@customer.company_id)
      @header = @item.name
    end
    @partner = Company.find(@customer.partner_id)
  end

  # GET /accounts/1
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
    @account.customer_id = params[:customer_id]
    @account.is_account_ver = true
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  def create(account)
    @account = Account.new(account)

    if @account.save
      redirect_to accounts_path :customer_id => @account.customer_id, notice: 'Account was successfully created.'
    else
      render :new
    end
  end

  # PUT /accounts/1
  def update(account)
    if @account.update(account)
      redirect_to accounts_path :customer_id => @account.customer_id, notice: 'Account was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /accounts/1
  def destroy
    @customer_id = @account.customer_id
    @account.destroy
    redirect_to accounts_path :customer_id => @customer_id, notice: 'Account was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account(id)
      @account = Account.find(id)
    end
end
