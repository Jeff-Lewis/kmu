json.array!(@partner_links) do |partner_link|
  json.extract! partner_link, :id, :partner_id, :name, :description, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at, :active, :link
  json.url partner_link_url(partner_link, format: :json)
end
