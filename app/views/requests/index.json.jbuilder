json.array!(@requests) do |request|
  json.extract! request, :id, :rtype, :active, :date_from, :date_to, :company_id, :user_id, :name, :description, :social
  json.url request_url(request, format: :json)
end
