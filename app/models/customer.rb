class Customer < ActiveRecord::Base
    has_many :accounts, dependent: :destroy 
    belongs_to :user
    belongs_to :company
end
