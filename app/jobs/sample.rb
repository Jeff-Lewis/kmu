Dashing.scheduler.every '30s' do

if 1>2

id = 1
id = rand(3)+1
@user = User.find(id)

# find running #companies
@count_companies = Company.where("user_id=?",id).count

# find running #workorders
@count_workorders = Workorder.where("user_id=?",id).count

# find workorders accessible
array = []
accesses = Access.where("user_id=?", id)
accesses.each do |ac|
  array << ac.workorder_id
end
@count_wo_access = Workorder.where(:id => array).count

# find hours reported current month
@count_tt_hours = Timetrack.where("user_id=? and datum>=? and datum <=?",id, Date.today.beginning_of_month, Date.today.end_of_month).sum(:amount)

# find chargeability
# monthly
@p_months = Planning.where("user_id=? and year=? and month=? and period=?",id, Date.today.strftime("%Y").to_i, Date.today.strftime("%m").to_i, "Monthly")
c_month = 0
@p_months.each do |m|
    c_month = c_month + m.percentage
end
# weekly
week = []
cweek=""
for i in Date.today.beginning_of_month..Date.today.end_of_month
    cweek = i.strftime("%W")
    if week.index(cweek.to_i) == nil
        week << cweek.to_i
    end
end
c_week = 0
week.each do |w| 
    @p_weeks = Planning.where("user_id=? and year=? and week=? and period=?",id, Date.today.strftime("%Y").to_i, w, "Weekly")
    @p_weeks.each do |we|
        c_week = c_week + we.percentage
    end
end
c_week = c_week/week.count.to_f.to_i
# daily
anz_days = 0 
for i in Date.today.beginning_of_month..Date.today.end_of_month
    if i.strftime("%u").to_i <= 5
        anz_days = anz_days + 1
    end
end
@p_days = Planning.where("user_id=? and day>=? and day<=? and period=?",id, Date.today.beginning_of_month, Date.today.end_of_month, "Daily")
c_day = 0
@p_days.each do |m|
    c_day = c_day + m.percentage
end
c_day = c_day/anz_days.to_f.to_i

puts "month" + c_month.to_s
puts "week" + c_week.to_s
puts "day" + c_day.to_s

@planning_chargeability = c_month + c_week + c_day

@current_chargeability = (((@count_tt_hours/8).to_f/anz_days)*100.to_f).to_i
factor = ((Date.today.end_of_month.strftime("%d").to_f) / (Date.today.strftime("%d").to_f)).to_i
puts "Faktor"+factor.to_s 
@current_chargeability_f = ((@current_chargeability * factor).to_f).to_i

Dashing.send_event('show_companies', { current: @count_companies, last: rand(0) })
Dashing.send_event('show_workorders', { current: @count_workorders, last: rand(0) })
Dashing.send_event('show_acc_workorders', { current: @count_wo_access, last: rand(0) })
Dashing.send_event('hours_reported', { current: @count_tt_hours, last: rand(0) })
Dashing.send_event('chargeability_p', { value: @planning_chargeability })
Dashing.send_event('chargeability_r', { value: @current_chargeability })
Dashing.send_event('chargeability_r_m', { value: @current_chargeability_f })

  # Dashing.send_event('valuation', { current: current_valuation, last: last_valuation })
  # Dashing.send_event('wo_time'+id,   { value: diffi })
  # Dashing.send_event('wo_budget'+id,   { value: budget })
  # Dashing.send_event('wo_info'+id, { text: wo.name + Time.to_s })
  
end

end
