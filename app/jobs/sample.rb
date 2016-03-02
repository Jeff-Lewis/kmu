current_valuation = 0



Dashing.scheduler.every '10m' do
  last_valuation = current_valuation
  current_valuation = rand(100)

  # Dashing.send_event('valuation', { current: current_valuation, last: last_valuation })
  
  wo = Workorder.where("parent_id=? and user_id=?", 0, current_user.id)
  wo.each do |w|

    id = w.id.to_s

    Dashing.send_event('wo_info'+id, { text: w.name + w.budget.to_s })
    
    diffi = ((Date.today - w.start_date)/(w.end_date - w.start_date).to_f*100).to_i
    Dashing.send_event('wo_time'+id,   { value: diffi })

    anz_budget = w.budget
    anz_today = Timetrack.where("workorder_id=?",1).sum(:amount) * 1000
    budget = ((anz_today/anz_budget).to_f*100).to_i
    Dashing.send_event('wo_budget'+id,   { value: budget })

  end  
  # anz = rand(100)
  # Dashing.send_event('company3',   { value: anz })
  # @users = User.all
  # anz = @users.count  
  # Dashing.send_event('user',   { value: anz })
  # @workorders = Workorder.all
  # anz = @workorders.count  
  # Dashing.send_event('workorder',   { value: anz })
  # @timetracks = Timetrack.all
  # anz = @timetracks.count  
  # Dashing.send_event('timetrack',   { value: anz })

end
