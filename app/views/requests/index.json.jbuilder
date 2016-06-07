json.array!(@requests) do |request|
  json.extract! request, :id, :rtype, :active, :datum_von, :datum_bis, :company_id, :user_id, :name, :description, :social
  json.url request_url(request, format: :json)
end
