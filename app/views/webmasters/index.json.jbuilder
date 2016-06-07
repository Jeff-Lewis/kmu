json.array!(@webmasters) do |webmaster|
  json.extract! webmaster, :id, :object_name, :object_id, :user_id, :web_user_id, :user_comment, :web_user_comment, :status
  json.url webmaster_url(webmaster, format: :json)
end
