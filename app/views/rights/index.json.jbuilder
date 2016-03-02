json.array!(@rights) do |right|
  json.extract! right, :id, :company_id, :user_id, :superuser
  json.url right_url(right, format: :json)
end
