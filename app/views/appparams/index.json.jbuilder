json.array!(@appparams) do |appparam|
  json.extract! appparam, :id, :name, :description, :active
  json.url appparam_url(appparam, format: :json)
end
