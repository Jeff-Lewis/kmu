class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  permits :active, :name, :user_id, :description, :adress1, :adress2, :adress3, :phone1, :phone2, :avatar, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at

  # GET /companies
  def index
    @companies = Company.where("user_id=?", current_user.id).order(:name)
  end

  # GET /companies/1
  def show
  end

  # GET /companies/new
  def new
      @company = Company.new
      @company.user_id = current_user.id
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  def create(company)
    @company = Company.new(company)
    if @company.save
      redirect_to companies_url, notice: 'Company was successfully created'
      # redirect_to @company, notice: 'Company was successfully created.'
    else
      render :new
    end
  end

  # PUT /companies/1
  def update(company)
    if @company.update(company)
      redirect_to companies_url, notice: 'Company was successfully updated'
      # redirect_to @company, notice: 'Company was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
    redirect_to companies_url, notice: 'Company was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company(id)
      @company = Company.find(id)
    end
end
