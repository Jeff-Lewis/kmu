json.array!(@hs_ratings) do |hs_rating|
  json.extract! hs_rating, :id, :status, :user_id, :hotspot_id, :user_comment, :user_rating
  json.url hs_rating_url(hs_rating, format: :json)
end
