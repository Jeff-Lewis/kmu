json.array!(@donation_stats) do |donation_stat|
  json.extract! donation_stat, :id, :donation_id, :user_id, :company_id, :amount, :anonymous
  json.url donation_stat_url(donation_stat, format: :json)
end
