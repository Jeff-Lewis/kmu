json.array!(@favourits) do |favourit|
  json.extract! favourit, :id, :user_id, :object_name, :object_id, :category, :stichworte, :email, :ticker, :active
  json.url favourit_url(favourit, format: :json)
end
