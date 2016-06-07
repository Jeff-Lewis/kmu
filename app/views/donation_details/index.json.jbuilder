json.array!(@donation_details) do |donation_detail|
  json.extract! donation_detail, :id, :donation_id, :name, :description, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at
  json.url donation_detail_url(donation_detail, format: :json)
end
