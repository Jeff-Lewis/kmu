json.array!(@timetracks) do |timetrack|
  json.extract! timetrack, :id, :user_id, :workorder_id, :tandm, :amount
  json.url timetrack_url(timetrack, format: :json)
end
