class Job < ActiveRecord::Base
    belongs_to :company
    belongs_to :category
    
    def self.search(search)
      if search != nil
        where('active=? and stichworte LIKE ? OR name LIKE ?', true, "%#{search}%", "%#{search}%")
      else
        where('active=?' , true)
      end
    end

end
