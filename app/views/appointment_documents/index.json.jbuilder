json.array!(@appointment_documents) do |appointment_document|
  json.extract! appointment_document, :id, :appointment_id, :name, :description, :document_file_name, :document_content_type, :document_file_size, :document_updated_at
  json.url appointment_document_url(appointment_document, format: :json)
end
