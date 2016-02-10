class StatsController < ApplicationController
  def user
    @timetracks = Timetrack.all
    @people = User.all
    @workorders = Workorder.all
  end
  def workorder
    @timetracks = Timetrack.all
    @people = User.all
    @workorders = Workorder.all
  end
end
