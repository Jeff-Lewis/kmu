class Vehicle < ActiveRecord::Base
    
    belongs_to :user
    belongs_to :company
    belongs_to :mob_category
    has_many :calenders, dependent: :destroy
    
    validates :name, presence: true
    
    before_validation :update_geo_address
      
    geocoded_by :geo_address
    after_validation :geocode
    
    has_attached_file :avatar, default_url: "/images/:style/missing.png", :styles => {:medium => "250x250#", :small => "50x50#" }
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
    
    def update_geo_address
      self.geo_address = self.address1 + " " + address2 + " " + address3
    end
    
      def self.search(filter, search)
        if filter
            @search = Search.find(filter)
            where(@search.build_sql)
        else
          if search
                where('active=? and stichworte LIKE ? OR name LIKE ?', true, "%#{search}%", "%#{search}%")
          else
                where('active=?', true)
          end
        end
      end

end
