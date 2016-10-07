json.array!(@user_positions) do |user_position|
  json.extract! user_position, :id, :user_id, :latitude, :longitude, :geo_address
  json.url user_position_url(user_position, format: :json)
end
