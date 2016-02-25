module PlanningsHelper
    
  def current_period(p, item)
    case p
    when $period_options[0]
        if Date.today.strftime("%m").to_i == item
            return true
        end
    when $period_options[1]
        if Date.today.strftime("%W").to_i == item
            return true
        end
    when $period_options[2]
        
        puts Date.new($c_year, $c_month, item)
        if Date.today == Date.new($c_year, $c_month, item)
            return true
        end
    end
    return false
  end

  def plans (p, w)
    html = ""
    html << content_tag(:tr, class:"plans_row") do
        
        concat(content_tag(:td, class:"plans_col") do
                if !w.avatar_file_name
                  image_tag("s_anonym.jpg", :size => "50x50", class:"img-rounded")
                else
                  image_tag(w.avatar(:small), class:"img-rounded")
                end
            end)
        
        concat(content_tag(:td, w.name, class:"plans_col"))
        
        for i in 0..@header.length-1 do
            
            @plans = eval_plan(w, p, @data[i])
            if @plans.count != 0
                concat(content_tag(:td, class:"info") do
                    @plans.each do |pl|
                        @total[i] = @total[i] + pl.percentage
                        concat(pl.percentage.to_s)
                        concat(link_to "", pl, :method => :delete, :data => {:confirm => "You Sure?"}, class:"plans_col btn btn-default btn-xs glyphicon glyphicon-trash pull-right").html_safe
                        concat(link_to "", edit_planning_path(pl.id), class:"btn btn-default btn-xs glyphicon glyphicon-time pull-right").html_safe
                        concat(link_to "", new_planning_path(:workorder_id => w.id, :user_id => $logon_user_id, :date => @data[i]), class:"btn btn-default btn-xs glyphicon glyphicon-plus pull-right").html_safe
                    end
                end)
            else
                concat(content_tag(:td, "", class:"plans_col") do
                    concat(link_to "", new_planning_path(:workorder_id => w.id, :user_id => $logon_user_id, :date => @data[i]), class:"btn btn-default btn-xs glyphicon glyphicon-plus pull-right").html_safe
                end)
            end
            
        end
        
    end
    return html.html_safe
  end

  def eval_plan(w, p, item)
    case p
    when $period_options[0]
        year = $c_year
        month = item
        @plans = Planning.where("user_id=? and workorder_id=? and year=? and month=? and week=? and day=?", $logon_user_id, w.id, year, month, 0, 0)

    when $period_options[1]
        year = $c_year
        month = $c_month
        week = item
        @plans = Planning.where("user_id=? and workorder_id=? and year=? and month=? and week=? and day=?", $logon_user_id, w.id, year, month, week, 0)

    when $period_options[2]
        year = $c_year
        month = $c_month
        week = $c_week
        day = item
        @plans = Planning.where("user_id=? and workorder_id=? and year=? and month=? and week=? and day=?", $logon_user_id, w.id, year, month, week, day)
    end
    return @plans
  end

end
