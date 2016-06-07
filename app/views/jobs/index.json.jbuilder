json.array!(@jobs) do |job|
  json.extract! job, :id, :company_id, :name, :active, :branche_id, :stichworte, :tasks, :skills, :offers, :contacts
  json.url job_url(job, format: :json)
end
