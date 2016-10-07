class UserPositionsController < ApplicationController
  before_action :set_user_position, only: [:show, :edit, :update, :destroy]
  permits :user_id, :latitude, :longitude, :geo_address

  # GET /user_positions
  def index
    @user_positions = UserPosition.all
  end

  # GET /user_positions/1
  def show
  end

  # GET /user_positions/new
  def new
    @user_position = UserPosition.new
    @user_position.latitude = request.location.latitude
    @user_position.longitude = request.location.longitude
    @user_position.user_id = current_user.id
  end

  # GET /user_positions/1/edit
  def edit
  end

  # POST /user_positions
  def create(user_position)
    @user_position = UserPosition.new(user_position)

    if @user_position.save
      redirect_to @user_position, notice: 'User position was successfully created.'
    else
      render :new
    end
  end

  # PUT /user_positions/1
  def update(user_position)
    if @user_position.update(user_position)
      redirect_to @user_position, notice: 'User position was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /user_positions/1
  def destroy
    @user_position.destroy

    redirect_to user_positions_url, notice: 'User position was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_position(id)
      @user_position = UserPosition.find(id)
    end
end
