class Timetrack < ActiveRecord::Base
    belongs_to :user
    belongs_to :workorder
end
