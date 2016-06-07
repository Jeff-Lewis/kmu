json.array!(@hotspot_details) do |hotspot_detail|
  json.extract! hotspot_detail, :id, :hotspot_id, :status, :name, :description, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at
  json.url hotspot_detail_url(hotspot_detail, format: :json)
end
