class Donation < ActiveRecord::Base
    belongs_to :company
    belongs_to :user
    has_many :donation_details, dependent: :destroy 
    has_many :donation_stats, dependent: :destroy 
    
    def self.search(filter, search, dtype)
      if filter
            @search = Search.find(filter)
            where(@search.build_sql)
      else
        if search
          where('dtype=? and active=? and stichworte LIKE ? OR name LIKE ?', dtype, true, "%#{search}%", "%#{search}%")
        else
          where('dtype=? and active=?', dtype, true)
        end
      end 
    end
    
end
