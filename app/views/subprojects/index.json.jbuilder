json.array!(@subprojects) do |subproject|
  json.extract! subproject, :id, :project_id, :user_id, :name, :description
  json.url subproject_url(subproject, format: :json)
end
