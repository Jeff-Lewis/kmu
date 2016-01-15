json.array!(@users) do |user|
  json.extract! user, :id, :userid, :password, :lastname, :name, :adress1, :adress2, :adress3, :phone1, :phone2, :org, :image, :costrate, :costinfo1, :costinfo2
  json.url user_url(user, format: :json)
end
