json.array!(@event_details) do |event_detail|
  json.extract! event_detail, :id, :event_id, :name, :description, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at
  json.url event_detail_url(event_detail, format: :json)
end
