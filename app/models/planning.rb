class Planning < ActiveRecord::Base
belongs_to :user
belongs_to :workorder

validates :user_id, presence: true
validates :workorder_id, presence: true
validates :percentage, numericality: {only_integer: true, greater_than: 1}
end
