module PlanningsHelper
    
    def Calendar(date = Date.today, &block)
        Calendar.new(self, date, block).table
    end
    
    class Calendar < Struct.new(:view, :date, :callback)
        HEADER = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
        START_DAY = :sunday
        
        delegate    :content_tag, to: :view
        
        def table
            content_tag :table, class: "calendar" do
                header + week_rows
            end
        end
        
        def header
            content_tag :tr do
                HEADER.map { |day| content_tag :th, day }.join.html_safe
            end
        end
        
        def week_rows
            weeks.map do |week|
                content_tag :tr do
                    week.map { |day| day_cell(day) }.join.html_safe
                end
            end.join.html_safe
        end
        
        def day_cell(day)
            content_tag :td, view.capture(day, &callback), class: day_classes(day)
        end
        
        def day_classes(day)
            classes = []
            classes << "today" if day == Date.today
            classes << "notmonth" if day.month != date.month
            classes.empty? ? nil : classes.join(" ")
        end
        
        def weeks
            first = date.beginning_of_month.beginning_of_week(START_DAY)
            last = date.end_of_month.end_of_week(START_DAY)
            (first..last).to_a.in_groups_of(7)
        end
        
    end

  def eval_quarter(d)
    month = d.month("%m")
    months = [1,2,3,4,5,6,7,8,9,10,11,12]
    case d
      when months[0,2].include?(month)
        return "Q1"
      when months[3,5].include?(month)
        return "Q2"
      when months[6,8].include?(month)
        return "Q3"
      when months[9,11].include?(month)
        return "Q4"
    end
  end
  
end
