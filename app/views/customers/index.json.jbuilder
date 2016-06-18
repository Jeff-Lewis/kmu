json.array!(@customers) do |customer|
  json.extract! customer, :id, :user_id, :company_id
  json.url customer_url(customer, format: :json)
end
