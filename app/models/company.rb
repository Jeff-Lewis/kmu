class Company < ActiveRecord::Base
    
    before_validation :update_geo_address
      
    geocoded_by :geo_address
    after_validation :geocode
    
    has_many :services, dependent: :destroy 
    has_many :donations, dependent: :destroy 
    has_many :donation_stats, dependent: :destroy 
    has_many :jobs, dependent: :destroy 
    has_many :sponsors, dependent: :destroy 
    has_many :vehicles, dependent: :destroy 
    has_many :events, dependent: :destroy 
    has_many :partner_links, dependent: :destroy 
    has_many :transactions, dependent: :destroy 
    has_many :customers, dependent: :destroy 

    has_many :bid_documents, dependent: :destroy 
    belongs_to :user
    belongs_to :category
    
    validates :name, presence: true
    validates :user_id, presence: true
    
    has_attached_file :avatar, default_url: "/images/:style/missing.png", :styles => {:medium => "250x250", :small => "50x50" }
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

      def update_geo_address
        self.geo_address = self.address1 + " " + address2 + " " + address3
      end
      
      def self.search(filter, search)
        if filter
            where(Search.find(filter).sql_string)
        else
          if search
              where('active=? and stichworte LIKE ? OR name LIKE ?', true, "%#{search}%", "%#{search}%")
            else
                where('active=?', true)
          end
        end
      end
      
end
