class PlanningsController < ApplicationController
  before_action :set_planning, only: [:show, :edit, :update, :destroy]
  permits :user_id, :workorder_id, :event, :year, :month, :week, :day, :percentage
  
  $c_year = Date.today.year
  $c_month = Date.today.month
  $c_quarter = 1
  $c_week = Date.today.strftime("%W").to_i

  $c_label = ""

  $period = "Week (Day)"
  $period_options = ["Year (Months)", "Year (Quarter)", "Month (Week)", "Week (Day)"]

  def prevp
    $period = params[:period]
    redirect_to plannings_path
  end

  def header(period, act)
    case $period
      when "Year (Months)"
          @header = %w[January February March April May June Juli August September Oktober November December]
          case act
          when "<"
            $c_year = $c_year - 1
          when ">"
            $c_year = $c_year + 1
          end
          $c_label = $c_year

      when "Year (Quarter)"
          months = %w[January February March April May June Juli August September Oktober November December]
          case act
          when "<"
            if $c_quarter == 1
              $c_year = $c_year - 1
              $c_quarter = 4
            else
              $c_quarter = $c_quarter - 1
            end
        
          when ">"
            if $c_quarter == 4
              $c_year = $c_year + 1
              $c_quarter = 1
            else
              $c_quarter = $c_quarter + 1
            end
          end
          $c_label = "Q"+$c_quarter.to_s + "/" + $c_year.to_s
          @header = months[$c_quarter*3 - 3, 3]
          
      when "Month (Week)"
          case act
          when "<"
            if $c_month == 1
              $c_year = $c_year - 1
              $c_month = 12
            else
              $c_month = $c_month - 1
            end
        
          when ">"
            if $c_month == 12
              $c_year = $c_year + 1
              $c_month = 1
            else
              $c_month = $c_month + 1
            end
          end

          starting_date = Date.new($c_year,$c_month,1)
          cw = starting_date.strftime("%W").to_i

          tcw = cw
          while cw == tcw
            tcw = starting_date.prev_day.strftime("%W").to_i
            if tcw == cw
                starting_date = starting_date.prev_day
            end
          end
          @header = []
          for i in 1..5
            start_of_week = (starting_date + i*7-7)
            cw = start_of_week.strftime("%W").to_i
            end_of_week = start_of_week + 7
            @header << "CW " + cw.to_s + " " + start_of_week.strftime("%d.%m") + "-" + end_of_week.strftime("%d.%m")
          end
          $c_label = "Calendar weeks "+ starting_date.strftime("%B") + "/" + $c_year.to_s

# day based planning
      when "Week (Day)"
          case act
          when "<"
            if $c_week == 1
              $c_year = $c_year - 1
              $c_week = 53
            else
              $c_week = $c_week - 1
            end
        
          when ">"
            if $c_week== 53
              $c_year = $c_year + 1
              $c_week = 1
            else
              $c_week = $c_week + 1
            end
          end
          
          starting_date = Date.commercial($c_year,$c_week)
          @header = []
          @data = []
          for i in 0..6
            @header << (starting_date+i).strftime("%a") + " " + (starting_date + i).to_s
            @data << starting_date + i
          end
          $c_label = "Week No"+$c_week.to_s + "/" + $c_year.to_s

    end
    
  end
  
  # GET /plannings
  def index
    
    if params[:dir] != nil
      header($period, params[:dir])
    else
      header($period, "=")
    end

    @plannings = Planning.all
    @workorders = Workorder.all

  end

  # GET /plannings/1
  def show
  end

  # GET /plannings/new
  def new
    @planning = Planning.new
    @planning.workorder_id = params[:workorder_id]
    @planning.user_id = params[:user_id]
    tdate = Date.parse(params[:date])
    @planning.year = tdate.strftime("%Y").to_i
    @planning.month = tdate.strftime("%m").to_i
    @planning.week = tdate.strftime("%V").to_i
    @planning.day = tdate.strftime("%d").to_i
  end

  # GET /plannings/1/edit
  def edit
  end

  # POST /plannings
  def create(planning)
    @planning = Planning.new(planning)

    if @planning.save
      redirect_to @planning, notice: 'Planning was successfully created.'
    else
      render :new
    end
  end

  # PUT /plannings/1
  def update(planning)
    if @planning.update(planning)
      redirect_to @planning, notice: 'Planning was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /plannings/1
  def destroy
    @planning.destroy

    redirect_to plannings_url, notice: 'Planning was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_planning(id)
      @planning = Planning.find(id)
    end
end
