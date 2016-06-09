class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  permits :status, :active, :name, :homepage, :category_id, :social, :stichworte, :user_id, :description, :address1, :address2, :address3, :geo_address, :longitude, :latitude, :phone1, :phone2, :avatar, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at

  $branchen_codes = []

  # GET /companies
  def index
    
    if params[:sql_string] != nil
      @companies = Company.paginate_by_sql(params[:sql_string], :page => params[:page], :per_page => 10)
    else
      @companies = Company.search(params[:search],params[:user_id]).page(params[:page]).per_page(10)
    end
    @companz = @companies.count

    z = 0
    @hash = Gmaps4rails.build_markers(@companies) do |company, marker|
      if company.latitude != nil and company.longitude != nil
        marker.lat company.latitude
        marker.lng company.longitude
        z=z+1
        marker.infowindow z.to_s+ " " + company.name
#      marker.picture url: "http://images/ma_anonym.png"
      end
     end
    
  end

  # GET /companies/1
  def show
  end

  # GET /companies/new
  def new
      @company = Company.new
      @company.user_id = current_user.id
      @company.active = true
      @company.status = "new"
  end

  # GET /companies/1/edit
  def edit
    @company.status = "changed"
  end

  # POST /companies
  def create(company)
    @company = Company.new(company)
    if @company.save
      redirect_to @company, notice: 'Company was successfully created'
      # redirect_to @company, notice: 'Company was successfully created.'
    else
      render :new
    end
  end

  # PUT /companies/1
  def update(company)
    if @company.update(company)
      redirect_to @company, notice: 'Company was successfully updated'
    else
      render :edit
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
    redirect_to companies_path :page => session[:page],  notice: 'Company was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company(id)
      @company = Company.find(id)
    end
end
