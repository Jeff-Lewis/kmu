class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  permits :partner, :status, :active, :name, :homepage, :category_id, :social, :stichworte, :user_id, :description, :address1, :address2, :address3, :geo_address, :longitude, :latitude, :phone1, :phone2, :avatar, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at

  $branchen_codes = []

  # GET /companies
  def index
    
    if params[:page]
      session[:page] = params[:page]
    end
    
    @companies = Company.search(params[:filter_id], params[:search]).page(params[:page]).per_page(16)
    @companz = @companies.count

    @hash = Gmaps4rails.build_markers(@companies) do |company, marker|
      if company.latitude != nil and company.longitude != nil
        marker.lat company.latitude
        marker.lng company.longitude
        marker.infowindow "<a href=/companies/" + company.id.to_s + ">" + company.name + "</a>"
        if company.avatar 
          marker.picture :url => url_for(company.avatar(:small)), :width => 50, :height => 50
        else
          marker.picture :url => "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|", :width => 50, :height => 50
        end
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
      @company.partner = false
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
