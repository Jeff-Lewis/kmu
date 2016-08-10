json.array!(@advisors) do |advisor|
  json.extract! advisor, :id, :service_id, :user_id, :grade
  json.url advisor_url(advisor, format: :json)
end
