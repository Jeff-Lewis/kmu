json.array!(@searches) do |search|
  json.extract! search, :id, :keywords, :noga, :distance, :from_lat, :from_lgt, :special, :rating
  json.url search_url(search, format: :json)
end
