class SponsorsController < ApplicationController
  before_action :set_sponsor, only: [:show, :edit, :update, :destroy]
  permits :status, :company_id, :event_id, :active, :slevel

  # GET /sponsors
  def index
    if params[:event_id]
      session[:event_id] = params[:event_id]
    end
    @sponsors = Sponsor.search(params[:event_id]).page(params[:page]).per_page(10)
    @event = Event.find(params[:event_id])
  end

  # GET /sponsors/1
  def show
  end

  # GET /sponsors/new
  def new
    @sponsor = Sponsor.new
    @sponsor.event_id = params[:event_id]
    @sponsor.active = true
    @sponsor.slevel = "1"
    @sponsor.status = "new"
  end

  # GET /sponsors/1/edit
  def edit
    @sponsor.status = "changed"
  end

  # POST /sponsors
  def create(sponsor)
    @sponsor = Sponsor.new(sponsor)

    if @sponsor.save
      redirect_to event_path(:id => @sponsor.event.id, :topic => "Eventsponsor"), notice: 'Sponsor was successfully created.'
    else
      render :new
    end
  end

  # PUT /sponsors/1
  def update(sponsor)
    if @sponsor.update(sponsor)
      redirect_to @sponsor.event, notice: 'Sponsor was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sponsors/1
  def destroy
    @id = @sponsor.event.id
    @sponsor.destroy
    redirect_to event_path(:id => @id, :topic => "Eventsponsor"), notice: 'Sponsor was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sponsor(id)
      @sponsor = Sponsor.find(id)
    end
end
