class HsRatingsController < ApplicationController
  before_action :set_hs_rating, only: [:show, :edit, :update, :destroy]
  permits :status, :user_id, :hotspot_id, :user_comment, :user_rating

  # GET /hs_ratings
  def index
    @hs_ratings = HsRating.all
  end

  # GET /hs_ratings/1
  def show
  end

  # GET /hs_ratings/new
  def new
    @hs_rating = HsRating.new
    @hs_rating.hotspot_id = params[:hotspot_id]
    @hs_rating.user_id = params[:user_id]
  end

  # GET /hs_ratings/1/edit
  def edit
  end

  # POST /hs_ratings
  def create(hs_rating)
    @hs_rating = HsRating.new(hs_rating)

    if @hs_rating.save
      redirect_to @hs_rating.hotspot, notice: 'Hs rating was successfully created.'
    else
      render :new
    end
  end

  # PUT /hs_ratings/1
  def update(hs_rating)
    if @hs_rating.update(hs_rating)
      redirect_to @hs_rating.hotspot, notice: 'Hs rating was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /hs_ratings/1
  def destroy
    @hs = @hs_rating.hotspot
    @hs_rating.destroy
    redirect_to @hs, notice: 'Hs rating was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hs_rating(id)
      @hs_rating = HsRating.find(id)
    end
end
