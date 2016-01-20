class Subproject < ActiveRecord::Base
    
    belongs_to :project
    belongs_to :user
    has_many :workorders
    
end
