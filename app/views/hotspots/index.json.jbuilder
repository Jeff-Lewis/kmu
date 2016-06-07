json.array!(@hotspots) do |hotspot|
  json.extract! hotspot, :id, :user_id, :status, :active, :hs_category_id, :name, :description, :geo_address, :address1, :address2, :address3, :latitude, :longitude, :stichworte
  json.url hotspot_url(hotspot, format: :json)
end
