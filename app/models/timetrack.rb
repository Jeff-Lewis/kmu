class Timetrack < ActiveRecord::Base
    belongs_to :user
    belongs_to :workorder

validates :user_id, presence: true
validates :workorder_id, presence: true
validates :datum, presence: true
validates :activity, presence: true
validates :tandm, presence: true
validates :amount, numericality: { greater_than: 0}

end
