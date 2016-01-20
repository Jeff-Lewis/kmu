json.array!(@workorders) do |workorder|
  json.extract! workorder, :id, :subproject_id, :user_id, :name, :description
  json.url workorder_url(workorder, format: :json)
end
