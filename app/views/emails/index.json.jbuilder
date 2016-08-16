json.array!(@emails) do |email|
  json.extract! email, :id, :header, :body, :m_from, :m_to
  json.url email_url(email, format: :json)
end
