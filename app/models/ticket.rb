class Ticket < ActiveRecord::Base
    has_many :user_tickets
    belongs_to :sponsor
    belongs_to :ticket_category
end
