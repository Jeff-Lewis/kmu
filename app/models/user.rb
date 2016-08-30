class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :webmasters, dependent: :destroy 
    has_many :services, dependent: :destroy 
    has_many :companies, dependent: :destroy 
    has_many :ratings, dependent: :destroy 
    has_many :hs_ratings, dependent: :destroy 
    has_many :requests, dependent: :destroy 
    has_many :vehicles, dependent: :destroy 
    has_many :donation_stats, dependent: :destroy 
    has_many :bids, dependent: :destroy 
    has_many :events, dependent: :destroy 
    has_many :favourits, dependent: :destroy 
    has_many :hotspots, dependent: :destroy
    has_many :searches, dependent: :destroy
    has_many :customers, dependent: :destroy 
    has_many :user_tickets, dependent: :destroy 
    has_many :advisors, dependent: :destroy 
    has_many :transactions, dependent: :destroy 
    has_many :donations, dependent: :destroy 
    
    # validates :userid, presence: true, :uniqueness => true
    validates :lastname, presence: true    
    validates :name, presence: true
    
    before_validation :update_geo_address
    geocoded_by :geo_address
    after_validation :geocode

    has_attached_file :avatar, default_url: "/images/:style/missing.png", :styles => {:big => "800x800", :medium => "300x300#", :thumb => "100x100#", :small => "50x50#" }
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
    
    def self.search(filter, search)
        if filter
            where(Search.find(filter).sql_string)
        else
            if search
                where('anonymous=? and active=? and (name LIKE ? OR lastname LIKE ? OR email LIKE ?)', false, true, "%#{search}%","%#{search}%","%#{search}%")
            else
                where('anonymous=? and active=?',false, true)
            end
        end
    end

    def update_geo_address
      self.geo_address = self.address1 + " " + address2 + " " + address3
    end

end
