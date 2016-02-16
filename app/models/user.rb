class User < ActiveRecord::Base
    has_many :workorders
    has_many :accesses
    has_many :timetracks
    has_many :companies

    validates :userid, presence: true, :uniqueness => true
    validates :lastname, presence: true    
    validates :name, presence: true
    
    has_attached_file :avatar, default_url: "/images/:style/missing.png", :styles => {:medium => "300x300", :thumb => "100x100", :small => "50x50" }
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
