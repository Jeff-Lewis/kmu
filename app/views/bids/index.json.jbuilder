json.array!(@bids) do |bid|
  json.extract! bid, :id, :user_id, :category_id, :name, :description, :active, :asap, :geo_address, :address1, :address2, :address3, :latitude, :longitude
  json.url bid_url(bid, format: :json)
end
