class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]
  permits :keywords, :noga, :distance, :from_lat, :from_lgt, :special, :rating

  # GET /searches
  def index
    @searches = Search.all
  end

  # GET /searches/1
  def show
    if @search.search_companies.empty?
      redirect_to new_search_path
    else
      redirect_to companies_path(:result => @search.search_companies)
    end
  end

  # GET /searches/new
  def new
    @search = Search.new
  end

  # GET /searches/1/edit
  def edit
  end

  # POST /searches
  def create(search)
    @search = Search.new(search)

    if @search.save
      redirect_to @search, notice: 'Search was successfully created.'
    else
      render :new
    end
  end

  # PUT /searches/1
  def update(search)
    if @search.update(search)
      redirect_to @search, notice: 'Search was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /searches/1
  def destroy
    @search.destroy

    redirect_to searches_url, notice: 'Search was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search(id)
      @search = Search.find(id)
    end
end
