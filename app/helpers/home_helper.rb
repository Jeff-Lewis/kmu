module HomeHelper

def User_dash(id)

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

#test-header
html = ""
html << content_tag(:table, class:"table table-striped table-hover") do
    concat(content_tag(:tr) do
        concat(content_tag(:td, "Companies defined"))
        concat(content_tag(:td, @count_companies))
    end)
    concat(content_tag(:tr) do
        concat(content_tag(:td, "Workorders defined"))
        concat(content_tag(:td, @count_workorders))
    end)
    concat(content_tag(:tr) do
        concat(content_tag(:td, "Workordersyou accessible"))
        concat(content_tag(:td, @count_wo_access))
    end)
    concat(content_tag(:tr) do
        concat(content_tag(:td, "Hours reported"))
        concat(content_tag(:td, @count_tt_hours))
    end)
    concat(content_tag(:tr) do
        concat(content_tag(:td, "Chargeability planned"))
        concat(content_tag(:td, @planning_chargeability))
    end)
    concat(content_tag(:tr) do
        concat(content_tag(:td, "Chargeability reported"))
        concat(content_tag(:td, @current_chargeability))
    end)
    concat(content_tag(:tr) do
        concat(content_tag(:td, "Chargeability reported (DateToMonth)"))
        concat(content_tag(:td, @current_chargeability_f))
    end)
end
return html.html_safe

# <div class="gridster">
#   <ul>
#     <li data-row="1" data-col="1" data-sizex="2" data-sizey="1">
#       <div data-id="welcome" data-view="Text" data-title="Hello" data-text="This is your shiny new dashboard." data-moreinfo="Protip: You can drag the widgets around!"></div>
#     </li>
#     <li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
#       <div data-id="company" data-view="Meter" data-title="#companies" data-min="0" data-max="100"></div>
#     </li>
#     <li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
#       <div data-id="user" data-view="Meter" data-title="#users" data-min="0" data-max="100"></div>
#     </li>
#     <li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
#       <div data-id="workorder" data-view="Meter" data-title="#workorders" data-min="0" data-max="100"></div>
#     </li>
#     <li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
#       <div data-id="timetrack" data-view="Meter" data-title="#time reports" data-min="0" data-max="100"></div>
#     </li>
#     <li data-row="1" data-col="1" data-sizex="1" data-sizey="2">
#       <div data-id="buzzwords" data-view="List" data-unordered="true" data-title="Buzzwords" data-moreinfo="# of times said around the office"></div>
#     </li>
#     <li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
#       <div data-id="valuation" data-view="Number" data-title="Current Valuation" data-moreinfo="In billions" data-prefix="$"></div>
#     </li>
#     <li data-row="1" data-col="1" data-sizex="2" data-sizey="1">
#       <div data-id="convergence" data-view="Graph" data-title="Convergence" style="background-color:#ff9618"></div>
#     </li>
#   </ul>
#   <center><div style="font-size: 12px">Try this: curl -X PUT 'http://<%= request.host %>:<%= request.port %>/dashing/widgets/welcome' -d "widget[text]=Dashing is awesome"</div></center>
# </div>

end
end