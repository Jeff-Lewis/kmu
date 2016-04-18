class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :workorders
    has_many :services
    has_many :accesses
    has_many :timetracks
    has_many :companies
    has_many :plannnings

    # validates :userid, presence: true, :uniqueness => true
    validates :lastname, presence: true    
    validates :name, presence: true
    
    before_validation :update_geo_address
      
    geocoded_by :geo_address
    after_validation :geocode
    
    has_attached_file :avatar, default_url: "/images/:style/missing.png", :styles => {:medium => "300x300", :thumb => "100x100", :small => "50x50" }
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
    
      def update_geo_address
        self.geo_address = self.address1 + " " + address2 + " " + address3
      end
      
      def self.search(search)
          if search
              where('name LIKE ? OR lastname LIKE ?', "%#{search}%","%#{search}%")
          else
              all
          end
      end

end
