class Access < ActiveRecord::Base

belongs_to :user
belongs_to :workorder

validates :user_id, presence: true
validates :workorder_id, presence: true

end