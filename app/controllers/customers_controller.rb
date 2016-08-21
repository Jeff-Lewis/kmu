class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  permits :customer_number, :partner_id, :user_id, :company_id, :tickets, :newsletter

  # GET /customers
  def index
    @partners = Company.where('partner=? and active=?', true, true).page(params[:page]).per_page(10)
    @paranz = @partners.count
  end

  # GET /customers/1
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
    @customer.user_id = params[:user_id]
    @customer.company_id = params[:company_id]
    @customer.partner_id = params[:partner_id]
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  def create(customer)
    @customer = Customer.new(customer)
    if @customer.save
      if @customer.user 
        redirect_to @customer.user, notice: 'Customer was successfully created.'
      else
        redirect_to @customer.company, notice: 'Customer was successfully created.'
      end
    else
      render :new
    end
  end

  # PUT /customers/1
  def update(customer)
    if @customer.update(customer)
      if @customer.user 
        redirect_to @customer.user, notice: 'Customer was successfully updated.'
      else
        redirect_to @customer.company, notice: 'Customer was successfully updated.'
      end
    else
      render :edit
    end
  end

  # DELETE /customers/1
  def destroy
    if @customer.user 
      @item = @customer.user
    else
      @item = @customer.company
    end
    @customer.destroy
    redirect_to @item
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer(id)
      @customer = Customer.find(id)
    end
end
