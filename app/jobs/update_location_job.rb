class UpdateLocationJob < ActiveJob::Base
  # RUN_EVERY = 1.hour
  RUN_EVERY = 1.minute

  def perform
    # do your thing
    session[:c_lat] = request.location.latitude
    session[:c_lon] = request.location.longitude
    self.class.perform_later(wait: RUN_EVERY)
  end
end
