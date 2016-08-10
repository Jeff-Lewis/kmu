class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  permits :channel, :status, :active, :subject, :user_id1, :user_id2, :date_from, :date_to, :time_from, :time_to, :reminder

  # GET /appointments
  def index
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
      @appointment = Appointment.find(params[:confirm_id])
      if @appointment
        @appointment.status = "bestaetigt"
        @appointment.save
      end
    end
    if params[:delete_id]
      @appointment = Appointment.find(params[:delete_id])
      if @appointment
        @appointment.destroy
      end
    end
    @start = Date.commercial(session[:year],session[:cw],1)
    @appointments = Appointment.search(params[:user_id1], session[:cw], session[:year]).order(date_from: :asc)
    @appanz = @appointments.count
    @user = User.find(params[:user_id1])
    @subject = params[:subject]
  end

  # GET /appointments/1
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
    @appointment.user_id1 = params[:user_id1]
    @appointment.user_id2 = params[:user_id2]
    @appointment.subject = params[:subject]
    @appointment.date_from = Date.today
    @appointment.date_to = Date.today
    @appointment.time_from = 8
    @appointment.time_to = 12
    if @appointment.user_id1 == current_user.id
      @appointment.status = "nicht verfügbar"
    else
      @appointment.status = "angefragt"
    end
    @appointment.active = true
    @appointment.channel = "Filiale"
    @appointment.reminder = true
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  def create(appointment)
    @appointment = Appointment.new(appointment)
    if @appointment.save
      redirect_to appointments_path(:user_id1 => @appointment.user_id1, :subject => @appointment.subject), notice: 'Appointment was successfully created.'
    else
      render :new
    end
  end

  # PUT /appointments/1
  def update(appointment)
    if @appointment.update(appointment)
      redirect_to appointments_path(:user_id1 => @appointment.user_id1, :subject => @appointment.subject), notice: 'Appointment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /appointments/1
  def destroy
    @usersave = @appointment.user_id1
    @subjectsave = @appointment.subject
    @appointment.destroy
    redirect_to appointments_path(:user_id1 => @usersave, :subject => @subjectsave), notice: 'Appointment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment(id)
      @appointment = Appointment.find(id)
      @appointment.date_to = @appointment.date_from
    end
end
