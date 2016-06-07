json.array!(@ratings) do |rating|
  json.extract! rating, :id, :user_id, :service_id, :user_comment, :user_rating, :anbieter_comment, :anbieter_rating
  json.url rating_url(rating, format: :json)
end
