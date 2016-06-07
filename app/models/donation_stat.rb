class DonationStat < ActiveRecord::Base
    
    belongs_to :donation
    belongs_to :company
    belongs_to :user
    
end
