class Company < ActiveRecord::Base
    has_many :workorders
    has_many  :rights
    belongs_to :user
    
    validates :name, presence: true
    validates :user_id, presence: true
    
    has_attached_file :avatar, default_url: "/images/:style/missing.png", :styles => {:medium => "300x300", :thumb => "100x100", :small => "50x50" }
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
