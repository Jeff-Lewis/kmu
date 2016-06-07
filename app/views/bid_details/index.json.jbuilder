json.array!(@bid_details) do |bid_detail|
  json.extract! bid_detail, :id, :bid_id, :name, :description, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at
  json.url bid_detail_url(bid_detail, format: :json)
end
