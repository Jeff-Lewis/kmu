class HotspotDetailsController < ApplicationController
  before_action :set_hotspot_detail, only: [:show, :edit, :update, :destroy]
  permits :hotspot_id, :status, :name, :description, :avatar

  # GET /hotspot_details
  def index
    @hotspot_details = HotspotDetail.all
  end

  # GET /hotspot_details/1
  def show
  end

  # GET /hotspot_details/new
  def new
    @hotspot_detail = HotspotDetail.new
    @hotspot_detail.hotspot_id = params[:hotspot_id]
    @hotspot_detail.status = "new"
  end

  # GET /hotspot_details/1/edit
  def edit
  end

  # POST /hotspot_details
  def create(hotspot_detail)
    @hotspot_detail = HotspotDetail.new(hotspot_detail)

    if @hotspot_detail.save
      redirect_to @hotspot_detail.hotspot, notice: 'Hotspot detail was successfully created.'
    else
      render :new
    end
  end

  # PUT /hotspot_details/1
  def update(hotspot_detail)
    if @hotspot_detail.update(hotspot_detail)
      redirect_to @hotspot_detail.hotspot, notice: 'Hotspot detail was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /hotspot_details/1
  def destroy
    @hotspot_detail.hotspot.destroy

    redirect_to hotspot_details_url, notice: 'Hotspot detail was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotspot_detail(id)
      @hotspot_detail = HotspotDetail.find(id)
    end
end
