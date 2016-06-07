json.array!(@request_details) do |request_detail|
  json.extract! request_detail, :id, :name, :description, :avatar_file_name, :avatar_content_type, :avatar_filesize, :avatar_updated_at
  json.url request_detail_url(request_detail, format: :json)
end
