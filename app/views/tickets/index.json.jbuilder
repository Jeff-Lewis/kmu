json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :sponsor_id, :ticket_category_id, :name, :description, :amount, :contingent
  json.url ticket_url(ticket, format: :json)
end
