json.array!(@bid_documents) do |bid_document|
  json.extract! bid_document, :id, :bid_id, :company_id, :name, :description, :status
  json.url bid_document_url(bid_document, format: :json)
end
