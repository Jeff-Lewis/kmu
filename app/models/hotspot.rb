class Hotspot < ActiveRecord::Base
    
    belongs_to :user
    has_many :hotspot_details
    has_many :hs_ratings
    
    before_validation :update_geo_address
    
    validates :name, presence: true

      
    geocoded_by :geo_address
    after_validation :geocode
    
    def update_geo_address
      self.geo_address = self.address1 + " " + address2 + " " + address3
    end
    
    def self.search(search)
        if search
            where('active=? and name LIKE ? OR stichworte LIKE ?', true, "%#{search}%","%#{search}%")
        else
            where('active=?',true)
        end
    end
    
end
