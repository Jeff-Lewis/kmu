class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  permits :active, :name, :branche_id, :stichworte, :user_id, :description, :address1, :address2, :address3, :geo_address, :longitude, :latitude, :phone1, :phone2, :avatar, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at

  $branchen_codes = []

  # GET /companies
  def index
    
    @branches = Branche.all.order(:name)
    @branches.each do |b|
      $branchen_codes << {b.id => b.name}
    end

    if params[:result] != nil
      @companies = params[:result]
    else
      @companies = Company.search(params[:search])
    end
    
    z = 0
    @hash = Gmaps4rails.build_markers(@companies) do |company, marker|
      marker.lat company.latitude
      marker.lng company.longitude
      z=z+1
      marker.infowindow z.to_s+ " " + company.name
#      marker.picture url: "http://images/ma_anonym.png"
     end
    
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
      # @company.geo_address = @company.address1 + " " + @company.address2 + " " + @company.address3 
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
