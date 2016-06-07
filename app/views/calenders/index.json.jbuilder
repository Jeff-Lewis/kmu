json.array!(@calenders) do |calender|
  json.extract! calender, :id, :vehicle_id, :user_id, :date_from, :date_to
  json.url calender_url(calender, format: :json)
end
