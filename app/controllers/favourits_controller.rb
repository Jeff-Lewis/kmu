class FavouritsController < ApplicationController
  before_action :set_favourit, only: [:show, :edit, :update, :destroy]
  permits :user_id, :object_name, :object_id, :category, :stichworte, :email, :ticker, :active

  # GET /favourits
  def index
    @favourits = Favourit.all
  end

  # GET /favourits/1
  def show
  end

  # GET /favourits/new
  def new

    if Favourit.where('user_id=? and object_name=? and object_id=?', current_user.id, params[:object_name],params[:object_id]).count == 0
    
      @favourit = Favourit.new
  
      @favourit.user_id = current_user.id
      @favourit.object_name = params[:object_name]
      @favourit.object_id = params[:object_id]
      @favourit.email = true
      @favourit.ticker = true
      @favourit.active = true
  
      @favourit.save
      
    end
      
    @item = Object.const_get(params[:object_name]).find(params[:object_id])
    redirect_to @item, notice: 'Favourit was successfully created.'

  end

  # GET /favourits/1/edit
  def edit
  end

  # POST /favourits
  def create(favourit)
    @favourit = Favourit.new(favourit)

    if @favourit.save
      redirect_to @favourit, notice: 'Favourit was successfully created.'
    else
      render :new
    end
  end

  # PUT /favourits/1
  def update(favourit)
    if @favourit.update(favourit)
      redirect_to @favourit.user, notice: 'Favourit was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /favourits/1
  def destroy
    @item = @favourit.user
    @favourit.destroy
    redirect_to @item, notice: 'Favourit was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favourit(id)
      @favourit = Favourit.find(id)
    end
end
