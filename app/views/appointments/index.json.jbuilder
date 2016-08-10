json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :status, :active, :subject, :subject_id, :user_id, :partner_id, :partner_type, :datum, :zeit, :reminder
  json.url appointment_url(appointment, format: :json)
end
