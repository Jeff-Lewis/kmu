class Right < ActiveRecord::Base
    belongs_to :user
    belongs_to :company
    
    validates :company_id, presence: true
    validates :user_id, presence: true
end
