json.array!(@companies) do |company|
  json.extract! company, :id, :active, :name, :description, :address1, :adress2, :adress3, :phone1, :phone2, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at
  json.url company_url(company, format: :json)
end
