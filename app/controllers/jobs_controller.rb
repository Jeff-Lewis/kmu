class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  permits :status, :company_id, :name, :active, :category_id, :stichworte, :tasks, :skills, :offers, :contacts

  $branchen_codes = []

  # GET /jobs
  def index
    
    if params[:company_id]
      session[:company_id] = params[:company_id]
    end
    
    @jobs = Job.search(params[:search]).page(params[:page]).per_page(10)
    @jobanz = @jobs.count

    z = 0
    @hash = Gmaps4rails.build_markers(@jobs) do |job, marker|
      if job.company
        if job.company.latitude != nil and job.company.longitude != nil
          marker.lat job.company.latitude
          marker.lng job.company.longitude
          z=z+1
          marker.infowindow z.to_s+ " " + job.company.name
  #      marker.picture url: "http://images/ma_anonym.png"
        end
      end
     end
  end

  # GET /jobs/1
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
    @job.company_id = session[:company_id]
    @job.active = true
    @job.status = "new"
  end

  # GET /jobs/1/edit
  def edit
    @job.status = "changed"
  end

  # POST /jobs
  def create(job)
    @job = Job.new(job)

    if @job.save
      redirect_to @job, notice: 'Job was successfully created.'
    else
      render :new
    end
  end

  # PUT /jobs/1
  def update(job)
    if @job.update(job)
      redirect_to @job, notice: 'Job was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /jobs/1
  def destroy
    @job.destroy
    redirect_to  jobs_path :page => session[:page], notice: 'Job was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job(id)
      @job = Job.find(id)
    end
end
