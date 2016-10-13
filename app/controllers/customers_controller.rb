class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  permits :customer_number, :partner_id, :user_id, :company_id, :tickets, :advisor_id, :newsletter

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

    @services = Service.where('company_id=?', params[:partner_id])
    @array=[]
    @services.each do |s|
      @array << s.id
    end
    @users = User.where('id IN (SELECT user_id FROM advisors WHERE service_id IN (?))',@array).page(params[:page]).per_page(20)

    @customer = Customer.new
    @customer.user_id = params[:user_id]
    @customer.company_id = params[:company_id]
    @customer.partner_id = params[:partner_id]
    @customer.newsletter = true
    @customer.tickets = true
  end

  # GET /customers/1/edit
  def edit
    @services = Service.where('company_id=?', @customer.partner_id)
    @array=[]
    @services.each do |s|
      @array << s.id
    end
    @users = User.where('id IN (SELECT user_id FROM advisors WHERE service_id IN (?))',@array).page(params[:page]).per_page(20)
  end

  # POST /customers
  def create(customer)
    @customer = Customer.new(customer)
    if @customer.save
      if @customer.user_id 
        redirect_to user_path(:id => @customer.user, :topic => "Customer"), notice: 'Customer was successfully created.'
      else
        redirect_to company_path(:id => @customer.company, :topic => "Customer"), notice: 'Customer was successfully created.'
      end
    else
      render :new
    end
  end

  # PUT /customers/1
  def update(customer)
    if @customer.update(customer)
      if @customer.user_id 
        redirect_to user_path(:id => @customer.user, :topic => "Customer"), notice: 'Customer was successfully created.'
      else
        redirect_to company_path(:id => @customer.company, :topic => "Customer"), notice: 'Customer was successfully created.'
      end
    else
      render :edit
    end
  end

  # DELETE /customers/1
  def destroy
    if @customer.user_id
      @us = @customer.user_id
    end
    if @customer.company_id
      @comp = @customer.company_id
    end
    @customer.destroy
      if @us 
        redirect_to user_path(:id => @us, :topic => "Customer"), notice: 'Customer was successfully created.'
      end
      if @comp
        redirect_to company_path(:id => @comp, :topic => "Customer"), notice: 'Customer was successfully created.'
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer(id)
      @customer = Customer.find(id)
    end
end
