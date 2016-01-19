json.array!(@projects) do |project|
  json.extract! project, :id, :name, :description, :adress1, :adress2, :adress3, :phone1, :phone2, :responsibility, :costinfo1, :costinfo2
  json.url project_url(project, format: :json)
end
