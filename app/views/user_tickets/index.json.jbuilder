json.array!(@user_tickets) do |user_ticket|
  json.extract! user_ticket, :id, :user_id, :ticket_id, :status
  json.url user_ticket_url(user_ticket, format: :json)
end
