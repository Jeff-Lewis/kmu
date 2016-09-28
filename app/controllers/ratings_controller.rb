class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]
  permits :status, :user_id, :service_id, :user_comment, :user_rating, :anbieter_comment, :anbieter_rating

  # GET /ratings
  def index
    if params[:service_id] != nil
      session[:service_id] = params[:service_id]
    end
    @ratings = Rating.where("service_id=?", params[:service_id]).order(:created_at).page(params[:page]).per_page(10)
  end

  # GET /ratings/1
  def show
  end

  # GET /ratings/new
  def new
    @rating = Rating.new
    @rating.service_id = params[:service_id]
    @rating.user_id = current_user.id
    @rating.created_at = Date.today
    @rating.anbieter_rating = 0
    @rating.user_rating = 0
    @rating.status = "new"
  end

  # GET /ratings/1/edit
  def edit
    @rating.status = "changed"
  end

  # POST /ratings
  def create(rating)
    @rating = Rating.new(rating)
    if @rating.save
      redirect_to service_path(:id => @rating.service, :topic => "Servicerating"), notice: 'Rating was successfully created.'
    else
      render :new
    end
  end

  # PUT /ratings/1
  def update(rating)
    if @rating.update(rating)
      redirect_to user_path(:id => @rating.user_id, :topic => "Rating"), notice: 'Rating was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ratings/1
  def destroy
    @us = @rating.user_id
    @rating.destroy
    redirect_to user_path(:id => @us, :topic => "Rating"), notice: 'Rating was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating(id)
      @rating = Rating.find(id)
    end
end
