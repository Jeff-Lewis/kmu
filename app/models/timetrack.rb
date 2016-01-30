class Timetrack < ActiveRecord::Base
    belongs_to :user_params
    belongs_to :workorder
end
