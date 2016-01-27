json.array!(@accesses) do |access|
  json.extract! access, :id, :user_id, :workorder_id, :access, :costrate
  json.url access_url(access, format: :json)
end
