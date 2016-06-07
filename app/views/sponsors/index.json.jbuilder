json.array!(@sponsors) do |sponsor|
  json.extract! sponsor, :id, :company_id, :event_id, :active, :slevel
  json.url sponsor_url(sponsor, format: :json)
end
