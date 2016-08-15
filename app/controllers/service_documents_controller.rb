class ServiceDocumentsController < ApplicationController
  before_action :set_service_document, only: [:show, :edit, :update, :destroy]
  permits :service_id, :name, :description, :document, :avatar

  # GET /service_documents
  def index
    @service_documents = ServiceDocument.all
  end

  # GET /service_documents/1
  def show
  end

  # GET /service_documents/new
  def new
    @service_document = ServiceDocument.new
    @service_document.service_id = params[:service_id]
  end

  # GET /service_documents/1/edit
  def edit
  end

  # POST /service_documents
  def create(service_document)
    @service_document = ServiceDocument.new(service_document)

    if @service_document.save
      redirect_to @service_document.service, notice: 'Service document was successfully created.'
    else
      render :new
    end
  end

  # PUT /service_documents/1
  def update(service_document)
    if @service_document.update(service_document)
      redirect_to @service_document.service, notice: 'Service document was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /service_documents/1
  def destroy
    @service = @service_document.service
    @service_document.destroy

    redirect_to @service, notice: 'Service document was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_document(id)
      @service_document = ServiceDocument.find(id)
    end
end
