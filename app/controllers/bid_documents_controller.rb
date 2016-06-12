class BidDocumentsController < ApplicationController
  before_action :set_bid_document, only: [:show, :edit, :update, :destroy]
  permits :bid_id, :company_id, :name, :description, :status, :document

  # GET /bid_documents
  def index
    @bid_documents = BidDocument.all
  end

  # GET /bid_documents/1
  def show
  end

  # GET /bid_documents/new
  def new
    @bid_document = BidDocument.new
    @bid_document.bid_id = params[:bid_id]
    if params[:mode] != nil
      @bid_document.company_id = 0
    end
  end

  # GET /bid_documents/1/edit
  def edit
  end

  # POST /bid_documents
  def create(bid_document)
    @bid_document = BidDocument.new(bid_document)

    if @bid_document.save
      redirect_to @bid_document.bid, notice: 'Bid document was successfully created.'
    else
      render :new
    end
  end

  # PUT /bid_documents/1
  def update(bid_document)
    if @bid_document.update(bid_document)
      redirect_to @bid_document.bid, notice: 'Bid document was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bid_documents/1
  def destroy
    @bid = @bid_document.bid
    @bid_document.destroy

    redirect_to @bid, notice: 'Bid document was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid_document(id)
      @bid_document = BidDocument.find(id)
    end
end
