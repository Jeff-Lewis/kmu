class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  permits :customer_number, :user_id, :company_id

  # GET /customers
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
    @customer.user_id = params[:user_id]
    @customer.company_id = params[:company_id]
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  def create(customer)
    @customer = Customer.new(customer)

    if @customer.save
      redirect_to home_index_path, notice: 'Customer was successfully created.'
    else
      render :new
    end
  end

  # PUT /customers/1
  def update(customer)
    if @customer.update(customer)
      redirect_to home_index_path, notice: 'Customer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /customers/1
  def destroy
    @customer.destroy
    redirect_to home_index_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer(id)
      @customer = Customer.find(id)
    end
end
