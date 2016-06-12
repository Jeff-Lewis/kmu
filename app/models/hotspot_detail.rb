class HotspotDetail < ActiveRecord::Base
    
    belongs_to :hotspot
    
    has_attached_file :avatar, default_url: "/images/:style/missing.png", :styles => {:big => "800x800", :medium => "300x300#", :thumb => "100x100#", :small => "50x50#" }
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

    validates :name, presence: true

end
