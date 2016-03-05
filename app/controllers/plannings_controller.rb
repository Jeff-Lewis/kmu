class PlanningsController < ApplicationController
  before_action :set_planning, only: [:show, :edit, :update, :destroy]
  permits :user_id, :workorder_id, :event, :year, :month, :week, :day, :percentage, :period
  

  def overview
    
    @period_options = ["Monthly", "Weekly", "Daily"]
    @c_year = Date.today.strftime("%Y").to_i
    @c_month = Date.today.strftime("%m").to_i
    @c_week = Date.today.strftime("%W").to_i

    if params[:period] != nil
      @period = params[:period]
      session[:period] = @period
    else
      @period = session[:period]
    end

    if params[:year] != nil
      @c_year = params[:year].to_i
    end

    if params[:month] != nil
      @c_month = params[:month].to_i
    end

    if params[:week] != nil
      @c_week = params[:week].to_i
    end

    if params[:dir] != nil
      act = params[:dir]
    else
      act = "="
    end

    # all workorders of user
    work = []
    accesses = Access.where("user_id=?", current_user.id)
    accesses.each do |ac|
      work << ac.workorder_id
    end
    @workorders = Workorder.where(:id => work)
    #@workorders = Workorder.all
    
    case @period
      when @period_options[0]
          @header = %w[January February March April May June Juli August September Oktober November December]
          @data = []
          for i in 1..12
            @data << i
          end
          case act
          when "<"
            @c_year = @c_year - 1
          when ">"
            @c_year = @c_year + 1
          end
          @c_label = "Year " + @c_year.to_s

      when @period_options[1]
          case act
          when "<"
            if @c_month == 1
              @c_year = @c_year - 1
              @c_month = 12
            else
              @c_month = @c_month - 1
            end
        
          when ">"
            if @c_month == 12
              @c_year = @c_year + 1
              @c_month = 1
            else
              @c_month = @c_month + 1
            end
          end

          starting_date = Date.new(@c_year,@c_month,1)
          cw = starting_date.strftime("%W").to_i
          tcw = cw
          while cw == tcw
            tcw = starting_date.prev_day.strftime("%W").to_i
            if tcw == cw
                starting_date = starting_date.prev_day
            end
          end
          @header = []
          @data = []
          for i in 1..5
            start_of_week = (starting_date + i*7-7)
            cw = start_of_week.strftime("%W").to_i
            end_of_week = start_of_week + 4
            @header << "CW " + cw.to_s + " " + start_of_week.strftime("%d.%m") + "-" + end_of_week.strftime("%d.%m")
            @data << cw
          end
          @c_label = "Calendar weeks "+ starting_date.strftime("%B") + "/" + @c_year.to_s

# day based planning
      when @period_options[2]
          case act
          when "<"
            if @c_week == 1
              @c_year = @c_year - 1
              @c_week = 53
            else
              @c_week = @c_week - 1
            end
        
          when ">"
            if @c_week== 53
              @c_year = @c_year + 1
              @c_week = 1
            else
              @c_week = @c_week + 1
            end
          end
          
          starting_date = Date.commercial(@c_year,@c_week)
          @c_month = starting_date.strftime("%m").to_i
          @header = []
          @data = []
          for i in 0..4
            @header << (starting_date+i).strftime("%a %d %B %Y")
            @data << starting_date + i
          end
          @c_label = "Week No. "+@c_week.to_s + "/" + @c_year.to_s
    end
    
  end
  
  # GET /plannings
  def index
  end

  # GET /plannings/1
  def show
  end

  # GET /plannings/new
  def new

    @period = params[:period]
    @period_options = params[:period_options]

    @planning = Planning.new

    @planning.workorder_id = params[:workorder_id]
    @planning.user_id = params[:user_id]
    
    @planning.period = @period
    @planning.year = params[:year]    

    case @period

    when @period_options[0]
      @planning.month = params[:date]
      # @planning.week = 0
      # @planning.day = 0
      
    when @period_options[1]
      @planning.month = params[:month]
      @planning.week = params[:date]
      # @planning.day = 0

    when @period_options[2]
      @planning.day = params[:date].to_date
    end
    
    session[:period] = @period
  end

  # GET /plannings/1/edit
  def edit
  end

  # POST /plannings
  def create(planning)
    @planning = Planning.new(planning)
    if @planning.save
      redirect_to plannings_overview_path(:period => session[:period]), notice: 'Planning was successfully created.'
    else
      render :new
    end
  end

  # PUT /plannings/1
  def update(planning)
    if @planning.update(planning)
      redirect_to plannings_overview_path, notice: 'Planning was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /plannings/1
  def destroy
    @planning.destroy

    redirect_to plannings_overview_path, notice: 'Planning was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_planning(id)
      @planning = Planning.find(id)
    end
end