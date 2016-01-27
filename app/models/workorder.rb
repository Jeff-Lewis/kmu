class Workorder < ActiveRecord::Base
    belongs_to :subproject
    belongs_to :user
    has_many  :accesses
end
