class Transaction < ActiveRecord::Base
    belongs_to :user
    belongs_to :company
    
    validates :amount, :numericality => { :greater_than => 0}
    
end
