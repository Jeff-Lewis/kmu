class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def webmaster
    if @user.webmaster == true
      @user.webmaster = false
    else
      @user.webmaster = true
    end
    @user.save
    redirect_to @user, notice: 'Webmaster '  
  end
  
  def ticketstatus
    if params[:userticket_id]
      @ut = UserTicket.find(params[:userticket_id])
      case params[:status]
        when "zurückgeben"
          @ut.status = "zurückgegeben"
        when "aktivieren"
          @ut.status = "aktiv"
        when "einlösen"
          @ut.status = "eingelöst"
      end
      @ut.save
    end
    redirect_to @ut.user, notice: 'Ticketstatus successfully updated '  
  end
  
  def index
    if params[:page] != nil
      session[:page] = params[:page]
    end
    @users = User.search(params[:filter_id],params[:search]).order(created_at: :desc).page(params[:page]).per_page(16)
    @usanz = @users.count
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      if user.latitude != nil and user.longitude != nil
        marker.lat user.latitude
        marker.lng user.longitude
        marker.infowindow "<a href=/users/" + user.id.to_s + ">" + user.name + " " + user.lastname + "</a>"
        if user.avatar != nil
          marker.picture :url => url_for(user.avatar(:small)), :width => 50, :height => 50
        else
          marker.picture :url => image-url("user_a.png"), :width => 50, :height => 50
        end
      end
     end
  end
  
  # GET /users/1
  # GET /users/1.json
  def show
    if params[:header] != nil and params[:body] != nil
      UserMailer.send_message(params[:id], params[:header], params[:body]).deliver_now
    end
     if params[:trx_status_ok_id]
       @trx = Transaction.find(params[:trx_status_ok_id])
       if @trx
         @trx.status = "freigegeben"
         @trx.save
       end
     end
     if params[:trx_status_ausgefuehrt_id]
       @trx = Transaction.find(params[:trx_status_ausgefuehrt_id])
       if @trx
         @trx.status = "ausgeführt"
         @trx.save
       end
     end
     if params[:topic]
       @topic = params[:topic]
     else 
       @topic = "User"
     end 
     
   if !session[:cw]
      session[:cw] = Date.today.cweek.to_i
    end
    if !session[:year]
      session[:year] = Date.today.year.to_i
    end
    if params[:dir]
      case params[:dir]
        when ">"
          if session[:cw] == 52
            session[:cw] = 1
            session[:year] = session[:year].to_i + 1
          else
            session[:cw] = session[:cw].to_i + 1
          end
        when "<"
          if session[:cw] == 1
            session[:cw] = 52
            session[:year] = session[:year].to_i - 1
          else
            session[:cw] = session[:cw].to_i - 1
          end
      end
    end
    if params[:confirm_id]
      @appoint = Appointment.find(params[:confirm_id])
      if @appoint
        @appoint.status = "bestaetigt"
        @appoint.save
      end
    end
    if params[:deny_id]
      @appoint = Appointment.find(params[:deny_id])
      if @appoint
        @appoint.status = "leider nicht möglich"
        @appoint.save
      end
    end
    @start = Date.commercial(session[:year],session[:cw],1)
    @appointments = Appointment.search(@user.id, session[:cw], session[:year]).order(app_date: :asc)
    @appanz = @appointments.count
    @subject = params[:subject]
    
  end

  # GET /users/new
  def new
    # @user = User.new
    # @user.superuser = false
    # if params[:mode] = "signin"
    #   @user.userid = params[:user_id]
    #   @user.active = true
    # end
  end

  # GET /users/1/edit
  def edit
    @user.status = "changed"
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        
        # send eMail
        puts "ATTENTION ATTENTION here we go...."
        UserMailer.signup_confirmation(@user, "newKMU Sign In Confirmation").deliver_now
        
        format.html { redirect_to users_url, notice: 'User was successfully created.' }
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
    if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    redirect_to users_path, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:calendar, :time_from, :time_to, :status, :dateofbirth, :email, :active, :anonymous, :webmaster, :userid, :lastname, :name, :address1, :address2, :address3, :geo_address, :longitude, :latitude, :phone1, :phone2, :org, :title, :costrate, :costinfo1, :avatar )
    end
    
end
