class Donation < ActiveRecord::Base
    belongs_to :company
    has_many :donation_details, dependent: :destroy 
    has_many :donation_stats, dependent: :destroy 
    
    def self.search(search)
      if search
        where('active=? and stichworte LIKE ? OR name LIKE ?', true, "%#{search}%", "%#{search}%")
      else
        where('active=?', true)
      end
    end
end