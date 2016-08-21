json.array!(@accounts) do |account|
  json.extract! account, :id, :customer_id, :company_id, :iban, :pref
  json.url account_url(account, format: :json)
end
