class StatsController < ApplicationController
  
  $start_date = Date.today.beginning_of_month
  $end_date = Date.today.end_of_month
  $workorder = ""
  
  def user
    # if $logon_superuser
    #   @people = User.all.order(:lastname)
    #   @workorders = Workorder.all.order(:name)
    # else
    #   @people = User.find($logon_user_id)
    #   array = []
    #   accesses = Access.where("user_id=?", $logon_user_id)
    #   accesses.each do |ac|
    #     array << ac.workorder_id
    #   end
    #   @workorders = Workorder.where(:id => array).order(:name)
    # end
    # $workorder = params[:workorder]
    # if $logon_superuser
    #     @timetracks = Timetrack.where("workorder_id=? and user_id=? and datum>=? and datum<=?", params[:workorder], params[:people], params[:starting_date], params[:ending_date]).order(:datum)
    # else
    #     @timetracks = Timetrack.where("workorder_id=? and user_id=? and datum>=? and datum<=?", params[:workorder], $logon_user_id, params[:starting_date], params[:ending_date]).order(:datum)
    # end
    # puts "Anzahl TT " + @timetracks.count.to_s
    
    @people = User.all
    @workorders = Workorder.all
    @timetracks = Timetrack.where("workorder_id=? and user_id=? and datum>=? and datum<=?", params[:workorder], params[:people], params[:starting_date], params[:ending_date]).order(:datum)
  end
  
  
  def workorder
    @timetracks = Timetrack.all
    @people = User.all

  end

end
