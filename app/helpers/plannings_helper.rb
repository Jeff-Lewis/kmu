module PlanningsHelper
    
    
    
  class Calendar
  
    def type
        @type
    end
    def items
        @items
    end

    def new(type)
        self.new
        @type = type
        case type
            when "monthly"
                @items = %w[Jan Feb Mar Apr Mai Jun Jul Aug Sep Oct Nov Dec]
            when "weekly"
                start_week = Date.today.strftime("%W").to_i
                for i in 0..4
                    @items << start_week + i
                end
            when "daily"
                @items = %w[Mon Tue Wed Thu Fre Sat Sun]
        end
    end

    def forward
    end
    
    def backward
    end
  end    
    
  def current_period(p, item)
    case p
    when @period_options[0]
        if Date.today.strftime("%m").to_i == item
            return true
        end
    when @period_options[1]
        if Date.today.strftime("%W").to_i == item
            return true
        end
    when @period_options[2]
        if Date.today == item
            return true
        end
    end
    return false
  end

  def plans (header, po, p, w, data, c_year, c_month, c_week)
      
    total = []
      
    puts "generate plan with..." + c_year.to_s + "/" + c_month.to_s + "/" + c_week.to_s
      
    html = ""
    html << content_tag(:tr, class:"plans_row") do
        
        concat(content_tag(:td, class:"plans_col") do
                if !w.avatar_file_name
                  image_tag("s_anonym.jpg", :size => "50x50", class:"img-rounded")
                else
                  image_tag(w.avatar(:small), class:"img-rounded")
                end
            end)
        
        concat(content_tag(:td, w.name + " " + w.start_date.strftime("%d.%m.%Y")+"-"+w.end_date.strftime("%d.%m.%Y"), class:"plans_col"))

        for i in 0..header.length-1 do
            
            total[i] = 0
            
            @plans = eval_plan(po, p, w, data[i], c_year, c_month, c_week)

            puts "generate plan with..." + @c_year.to_s + "/" + @c_month.to_s + "/" + @c_week.to_s
            puts "count is.."+ @plans.count.to_s

            if @plans.count != 0
                concat(content_tag(:td, class:"info") do
                    @plans.each do |pl|
                        total[i] = total[i] + pl.percentage
                        concat(pl.percentage.to_s)
                        concat(link_to "", pl, :method => :delete, :data => {:confirm => "You Sure?"}, class:"plans_col btn btn-default btn-xs glyphicon glyphicon-trash pull-right").html_safe
                        concat(link_to "", edit_planning_path(pl.id), class:"btn btn-default btn-xs glyphicon glyphicon-time pull-right").html_safe
                        concat(link_to "", new_planning_path(:workorder_id => w.id, :user_id => current_user.id, :date => data[i], :year => c_year, :month => c_month, :week => c_week, :period => p, :period_options => po), class:"btn btn-default btn-xs glyphicon glyphicon-plus pull-right").html_safe
                    end
                end)
            else
                concat(content_tag(:td, "", class:"plans_col") do
                    concat(link_to "", new_planning_path(:workorder_id => w.id, :user_id => current_user.id, :date => data[i], :year => c_year, :month => c_month, :week => c_week, :period => p, :period_options => po), class:"btn btn-default btn-xs glyphicon glyphicon-plus pull-right").html_safe
                end)
            end
            
        end
        
    end
    return {:html => html.html_safe, :total => total}
  end

  def eval_plan(po, p, w, item, c_year, c_month, c_week)
    case p
    when po[0]
        year = c_year
        month = item
        @plans = Planning.where("user_id=? and workorder_id=? and year=? and month=? and week=? and day=?", current_user.id, w.id, year, month, 0, 0)

    when po[1]
        year = c_year
        month = c_month
        week = item
        @plans = Planning.where("user_id=? and workorder_id=? and year=? and month=? and week=? and day=?", current_user.id, w.id, year, month, week, 0)

    when po[2]
        year = c_year
        month = c_month
        week = c_week
        day = item.to_s[9,2].to_i
        @plans = Planning.where("user_id=? and workorder_id=? and year=? and month=? and week=? and day=?", current_user.id, w.id, year, month, week, day)
    end
    return @plans
  end

end
