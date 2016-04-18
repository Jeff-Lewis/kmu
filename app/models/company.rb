class Company < ActiveRecord::Base
    
    before_validation :update_geo_address
      
    geocoded_by :geo_address
    after_validation :geocode
    
    has_many :workorders
    has_many :services
    has_many  :rights
    belongs_to :user
    belongs_to :branche
    
    validates :name, presence: true
    validates :user_id, presence: true
    
    has_attached_file :avatar, default_url: "/images/:style/missing.png", :styles => {:medium => "300x300", :thumb => "100x100", :small => "50x50" }
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

      def update_geo_address
        self.geo_address = self.address1 + " " + address2 + " " + address3
      end
      
      def self.search(search)
          if search
              where('stichworte LIKE ? OR name LIKE ?', "%#{search}%", "%#{search}%")
          else
              all
          end
      end
      
end
