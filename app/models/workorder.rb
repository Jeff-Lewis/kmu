class Workorder < ActiveRecord::Base
    belongs_to :user
    belongs_to :company
    has_many  :accesses
    has_many :timetracks
    
    validates :company_id, presence: true
    validates :parent_id, presence: true
    validates :user_id, presence: true    
    validates :name, presence: true
    
    has_attached_file :avatar, default_url: "/images/:style/missing.png", :styles => {:medium => "300x300", :thumb => "100x100", :small => "50x50" }
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
