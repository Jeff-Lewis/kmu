json.array!(@events) do |event|
  json.extract! event, :id, :active, :user_id, :name, :description, :date_from, :date_to, :avatar_filename, :avatar_content_type, :avatar_file_size, :avatar_updated_at
  json.url event_url(event, format: :json)
end
