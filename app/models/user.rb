class User < ActiveRecord::Base
    has_many :projects
    has_many :subprojects
    has_many :workorders
    has_many :accesses
    
    @sorter = 'Name'
    
    has_attached_file :avatar, default_url: "/images/:style/missing.png", :styles => {:medium => "300x300", :thumb => "100x100", :small => "50x50" }
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
