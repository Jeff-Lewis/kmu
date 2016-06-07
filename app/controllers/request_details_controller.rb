class RequestDetailsController < ApplicationController
  before_action :set_request_detail, only: [:show, :edit, :update, :destroy]
  permits :status, :name, :request_id, :description, :avatar

  # GET /request_details
  def index
    @request = Request.find(params[:request_id])
    @request_details = RequestDetail.where("request_id=?", params[:request_id])
  end

  # GET /request_details/1
  def show
  end

  # GET /request_details/new
  def new
    @request_detail = RequestDetail.new
    @request_detail.request_id = params[:request_id]
    @request_detail.status = "new"
  end

  # GET /request_details/1/edit
  def edit
    @request_detail.status = "changed"
  end

  # POST /request_details
  def create(request_detail)
    @request_detail = RequestDetail.new(request_detail)

    if @request_detail.save
      redirect_to @request_detail.request, notice: 'Request detail was successfully created.'
    else
      render :new
    end
  end

  # PUT /request_details/1
  def update(request_detail)
    if @request_detail.update(request_detail)
      redirect_to @request_detail.request :request_id => session[:request_id], notice: 'Request detail was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /request_details/1
  def destroy
    @request_detail.destroy

    redirect_to @request_detail.request :request_id => session[:request_id], notice: 'Request detail was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_detail(id)
      @request_detail = RequestDetail.find(id)
    end
end
