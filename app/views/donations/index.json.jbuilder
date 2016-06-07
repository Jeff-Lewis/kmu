json.array!(@donations) do |donation|
  json.extract! donation, :id, :name, :description, :company_id, :amount, :active, :stichworte.string
  json.url donation_url(donation, format: :json)
end
