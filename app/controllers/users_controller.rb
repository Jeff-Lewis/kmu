class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  $current_user_id = 0
  $current_user_name = ""
  $error_message = ""

  # GET /users
  # GET /users.json
  def login
    $error_message = "please login or sign in"
  end
  
  def verify_login
      @logonuser = User.where("userid=?", params[:userid])
      if @logonuser.count == 0
        $error_message = "email not registered..."
        render :action => "login"
      else
        if @logonuser.first.password == params[:password]
            $current_user_id = @logonuser.first.id
            $current_user_name = @logonuser.first.name + " " + @logonuser.first.lastname
            redirect_to users_path(:userid => $current_user_id, :superuser => @logonuser.first.superuser)
          else
            $error_message = "password not correct..."
            render :action => "login"
        end
      end 
  end
  
  def verify_signin
      @logonuser = User.where("userid=?", params[:userid])
      if @logonuser.count == 0
        puts "no user found !!!!!!!! Parameter " + params[:userid]

        @users = User.new
        @users.userid = params[:userid]
        @users.superuser = false
        #render :action => "new"

      else
        $error_message = "email already registered..."
        render :action => "login"
      end 
  end

  def choose
  if params[:searchstring] == nil or params[:searchstring] == ""
     @users = User.all.order("lastname")
  else
    str = "name='"+params[:searchstring]+"' OR lastname='"+params[:searchstring]+"' OR userid ='"+params[:searchstring]+ "'"
    @search = params[:searchstring]
    @users = User.where(str).order("lastname")
  end
  end
  
  def index
    superuser = User.find(params[:userid])
    if superuser.superuser
        @users = User.all.order('lastname ASC')
    else
        @users = User.where("id=?",params[:userid]).order('lastname ASC')
    end
  end
  
  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @user.superuser = false
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:userid, :password, :lastname, :name, :adress1, :adress2, :adress3, :phone1, :phone2, :org, :costrate, :costinfo1, :avatar )
    end
    
end
