class InactiveJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    # Do something later
    # requests

    # events

    # ...
    sleep 10
    logger.info "working..."

  end
end
