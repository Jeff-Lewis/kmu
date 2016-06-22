class Job < ActiveRecord::Base
    belongs_to :company
    belongs_to :category
    
    def self.search(filter, search)
      if filter
          where(Search.find(filter).sql_string)
      else
        if search
          where('active=? and stichworte LIKE ? OR name LIKE ?', true, "%#{search}%", "%#{search}%")
        else
          where('active=?' , true)
        end
      end
    end

end
