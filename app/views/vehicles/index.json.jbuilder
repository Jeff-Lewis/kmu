json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :id, :user_id, :name, :description, :category_id, :address1, :address2, :address3, :avatar_file_name, :avatar_content_type, :avatar_filesize, :avatar_updated_at
  json.url vehicle_url(vehicle, format: :json)
end
