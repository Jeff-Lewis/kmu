json.array!(@service_documents) do |service_document|
  json.extract! service_document, :id, :service_id, :name, :description, :document_file_name, :document_content_type, :document_file_size, :document_updated_at
  json.url service_document_url(service_document, format: :json)
end
