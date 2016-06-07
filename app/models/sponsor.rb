class Sponsor < ActiveRecord::Base
    belongs_to :company
    belongs_to :user
    belongs_to :event
    
    def self.search(event)
      if event
            where('active=? and event_id=?', true, event)
      else
            where('active=?', true)
      end
    end

end
