json.array!(@plannings) do |planning|
  json.extract! planning, :id, :user_id, :workorder_id, :event, :starting_date, :ending_date, :amount
  json.url planning_url(planning, format: :json)
end
