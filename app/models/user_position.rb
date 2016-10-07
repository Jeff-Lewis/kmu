class UserPosition < ActiveRecord::Base
    
reverse_geocoded_by :latitude, :longitude,
   :address => :geo_address
after_validation :reverse_geocode 
    
end
