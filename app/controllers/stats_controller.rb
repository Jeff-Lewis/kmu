class StatsController < ApplicationController
      
  $period_options = ["Monthly", "Weekly", "Daily"]
  $period = $period_options[2]
  $start_date = Date.today.beginning_of_month
  $end_date = Date.today.end_of_month
  $company_id = 0
  $workorder_id = 0
  $user_id = 0
  $include_sub = false
  $enable = false
  $row = 0
  
  def workorder

    if params[:starting_date] != nil
      $start_date = params[:starting_date]
    end
    if params[:ending_date] != nil
      $end_date = params[:ending_date]
    end
    if params[:company_id] != nil
      $company_id = params[:company_id]
    end
    if params[:workorder_id] != nil
      $workorder_id = params[:workorder_id]
    end
    if params[:include_sub] != nil
      $include_sub = params[:include_sub]
    end
    $filename = ""

    @companies = Company.where("user_id=?", $logon_user_id)
    @workorders = Workorder.where("user_id=? and company_id=?", $logon_user_id, $company_id)
      
    if $workorder_id.to_i > 0
      $enable = true      

      @tt1 = Timetrack.where("tandm=? and workorder_id=? and datum>=? and datum<=?", "TIME", params[:workorder_id], params[:starting_date], params[:ending_date]).order(:datum)
 
      if params[:data] == "WriteExcel" 
        # Create a new Excel Workbook
        $filename = "public/reports/ProMIS_Workorder_" + DateTime.now.to_s + ".xls"
        puts $filename
        workbook = WriteExcel.new($filename)
        
        # Add worksheet(s)
        worksheet  = workbook.add_worksheet
  
        # header format
        f_header0 = workbook.add_format
        f_header0.set_bold
        # f_header0.set_color('blue')
        f_header0.set_size(20)
        # format.set_align('right')
  
        f_header1 = workbook.add_format
        f_header1.set_color('white')
        f_header1.set_bg_color('black')
        
        f_param = workbook.add_format
        f_param.set_bold
        f_param.set_color('red')
  
        # col sizes
        worksheet.set_column(0,20,20)
        
        # # write a formatted and unformatted string.
        # worksheet.write(1, 1, 'Hi Excel.', format)  # cell B2
        # worksheet.write(2, 1, 'Hi Excel.')          # cell B3
        
        # # write a number and formula using A1 notation
        # worksheet.write('B4', 3.14159)
        # worksheet.write('B5', '=SIN(B4/4)')
        
        # write to file
        
        $row = 0
        col = 0
        worksheet.write($row, col, "ProMIS Workorder Reporting " + DateTime.now.strftime("%d.%m.%y-%H:%M"), f_header0)
        $row = $row + 2
        worksheet.write($row, col, "Parameters:", f_header1)
        $row = $row + 1
        worksheet.write($row, col, "Date start:")
        worksheet.write($row, col+1, $start_date.to_date.strftime("%d.%m.%y"), f_param)
        $row = $row + 1
        worksheet.write($row, col, "Date end:")
        worksheet.write($row, col+1, $end_date.to_date.strftime("%d.%m.%y"), f_param)
        $row = $row + 1
        worksheet.write($row, col, "Workorder:")
        @w = Workorder.find(params[:workorder_id])
        if @w != nil
          woname = @w.name
        else
          woname = "error ??"
        end
        worksheet.write($row, col+1, woname, f_param)
        $row = $row + 1
        worksheet.write($row, col, "include sub workorders:")
        if $include_sub
          woname = "yes"
        else
          woname = "no"
        end
        worksheet.write($row, col+1, woname, f_param)
  
        $row = $row + 2
        worksheet.write($row, col, "Company", f_header1)
        col = col + 1
        worksheet.write($row, col, "Reporting Date", f_header1)
        col = col + 1
        worksheet.write($row, col, "Year", f_header1)
        col = col + 1
        worksheet.write($row, col, "Month", f_header1)
        col = col + 1
        worksheet.write($row, col, "Day", f_header1)
        col = col + 1
        worksheet.write($row, col, "Workorder", f_header1)
        col = col + 1
        worksheet.write($row, col, "Employee", f_header1)
        col = col + 1
        worksheet.write($row, col, "std cost rate", f_header1)
        col = col + 1
        worksheet.write($row, col, "workorder cost rate", f_header1)
        col = col + 1
        worksheet.write($row, col, "hours reported", f_header1)
        col = col + 1
        worksheet.write($row, col, "costs reported", f_header1)
        col = col + 1
        worksheet.write($row, col, "material reported", f_header1)
  
        wo_iterate($workorder_id, worksheet)
  
        workbook.close
        
      end
    end
    
  end
  
  def wo_iterate(wo, worksheet)
    write_rows(wo, worksheet)
    if $include_sub
      subs = Workorder.where("parent_id=?", wo)
      subs.each do |s|
        wo_iterate(s.id, worksheet)
      end
    end
  end
  
  def write_rows(wo, worksheet)
    @timetracks = Timetrack.where("workorder_id=? and datum>=? and datum<=?", wo, $start_date, $end_date).order(:datum)
    @timetracks.each do |tt|
      $row = $row + 1
      worksheet.write($row, 0, tt.workorder.company.name)
      worksheet.write($row, 1, tt.datum.strftime("%d.%m.%Y"))
      worksheet.write($row, 2, tt.datum.strftime("%Y"))
      worksheet.write($row, 3, tt.datum.strftime("%m"))
      worksheet.write($row, 4, tt.datum.strftime("%d"))
      worksheet.write($row, 5, tt.workorder.name)
      worksheet.write($row, 6, tt.user.lastname + " " + tt.user.name)
      worksheet.write($row, 7, tt.user.costrate)
      special_rates = Access.where("user_id=? and workorder_id=?", tt.user.id, tt.workorder.id)
      if special_rates.first != nil
        cr = special_rates.first.costrate
      else
        cr = tt.user.costrate 
      end
      if cr == nil
        cr = 0
      end
      worksheet.write($row, 8, cr)
      if tt.tandm == "TIME"
        worksheet.write($row, 9, tt.amount)
        worksheet.write($row, 10, tt.amount * cr)
      else
        worksheet.write($row, 11, tt.amount)
      end
    end
  end
  
  # ------------------------------------------------------------------------
  # Ressourcenplanung
  # ------------------------------------------------------------------------
  def ressource
    
    if params[:starting_date] != nil
      $start_date = params[:starting_date]
    end
    if params[:ending_date] != nil
      $end_date = params[:ending_date]
    end
    if params[:company_id] != nil
      $company_id = params[:company_id]
    end
    if params[:user_id] != nil
      $user_id = params[:user_id]
    end
    if params[:period] != nil
      $period = params[:period]
    end
    $filename = ""
    
    puts "hello..."

    @companies = Company.where("user_id=?", $logon_user_id)
    
    array = []
    rights = Right.where("company_id=?", params[:company_id])
    rights.each do |ac|
      array << ac.user_id
    end
    @users = User.where(:id => array)

    # @users = User.where("user_id=?", $logon_user_id)
      
    if $user_id.to_i > 0
      $enable = true      

      @tt1 = Timetrack.where("tandm=? and workorder_id=? and datum>=? and datum<=?", "TIME", params[:workorder_id], params[:starting_date], params[:ending_date]).order(:datum)
 
      if params[:data] == "WriteExcel" 
        # Create a new Excel Workbook
        $filename = "public/reports/ProMIS_Ressource_" + DateTime.now.to_s + ".xls"
        puts $filename
        workbook = WriteExcel.new($filename)
        
        # Add worksheet(s)
        worksheet  = workbook.add_worksheet
  
        # header format
        f_header0 = workbook.add_format
        f_header0.set_bold
        # f_header0.set_color('blue')
        f_header0.set_size(20)
        # format.set_align('right')
  
        f_header1 = workbook.add_format
        f_header1.set_bold
        f_header1.set_color('white')
        f_header1.set_bg_color('black')
        
        f_param = workbook.add_format
        f_param.set_bold
        f_param.set_color('red')

        f_active = workbook.add_format
        f_active.set_bold
  
        f_weekend = workbook.add_format
        f_weekend.set_bg_color('silver')

        f_danger = workbook.add_format
        f_danger.set_bg_color('red')
        f_danger.set_color('white')
  
        f_warning = workbook.add_format
        f_warning.set_bg_color('orange')
        f_warning.set_color('white')

        f_success = workbook.add_format
        f_success.set_bg_color('green')
        f_success.set_color('white')

        # col sizes
        worksheet.set_column(0,2,20)
        
        # # write a formatted and unformatted string.
        # worksheet.write(1, 1, 'Hi Excel.', format)  # cell B2
        # worksheet.write(2, 1, 'Hi Excel.')          # cell B3
        
        # # write a number and formula using A1 notation
        # worksheet.write('B4', 3.14159)
        # worksheet.write('B5', '=SIN(B4/4)')
        
        # write to file
        
        $row = 0
        col = 0
        worksheet.write($row, col, "ProMIS Ressource Reporting " + DateTime.now.strftime("%d.%m.%y-%H:%M"), f_header0)
        $row = $row + 2
        worksheet.write($row, col, "Parameters:", f_header1)
        $row = $row + 1
        worksheet.write($row, col, "Date start:")
        worksheet.write($row, col+1, $start_date.to_date.strftime("%d.%m.%y"), f_param)
        $row = $row + 1
        worksheet.write($row, col, "Date end:")
        worksheet.write($row, col+1, $end_date.to_date.strftime("%d.%m.%y"), f_param)
        $row = $row + 1
        worksheet.write($row, col, "User:")
        @u = User.find(params[:user_id])
        if @u != nil
          uname = @u.lastname + " " + @u.name
        else
          uname = "error ??"
        end
        worksheet.write($row, col+1, uname, f_param)
        $row = $row + 1
        worksheet.write($row, col, "Periodicity:")
        worksheet.write($row, col+1, $period, f_param)

        $row = $row + 2
        worksheet.write($row, col, "Company", f_header1)
        col = col + 1
        worksheet.write($row, col, "User", f_header1)
        col = col + 1
        worksheet.write($row, col, "Workorder", f_header1)
        col = col + 1

        start = $start_date.to_date
        day_array_d = []
        day_array_w = []
        day_array_m = []

        week_array = []
        month_array = []

        # walk through all dates 
        while start <= $end_date.to_date

          day_array_d << start
          day_array_w << start.strftime("%W").to_i
          day_array_m << start.strftime("%m").to_i
          
          # write day header
          if $period == $period_options[2]
            worksheet.write($row, col, start.strftime("%d.%m.%y"), f_header1)
          end

          #eval months & weeks
          if !week_array.include?(start.strftime("%W"))
             week_array << start.strftime("%W")
          end
          if !month_array.include?(start.strftime("%m"))
             month_array << start.strftime("%m")
          end
          
          col = col + 1
          start = start + 1
        end

        # write week or month header
        if $period == $period_options[0]
          for j in 0..month_array.length-1
            worksheet.write($row, j+3, month_array[j], f_header1)
          end
        end
        if $period == $period_options[1]
          for j in 0..week_array.length-1
            worksheet.write($row, j+3, week_array[j], f_header1)
          end
        end
        
        us_iterate(worksheet, day_array_d, day_array_w, day_array_m, week_array, month_array, f_active, f_danger, f_warning, f_success, f_weekend)
        # wo_iterate($workorder_id, worksheet)
  
        workbook.close
        
      end
    end
    
    
    # just to test morris working - ignore
    @timetracks = Timetrack.all
    @people = User.all
    array = []
    for i in 0..100
      array << {"datum" => Date.today + i, "amount" => Math.sin(i)*100 }
    end
    @js = array
  end

  def us_iterate(worksheet, day_array_d, day_array_w, day_array_m, week_array, month_array, f_active, f_danger, f_warning, f_success, f_weekend)

    superuser = true
    if superuser
      users = User.all
    else
      users = User.where("user_id=?", $logon_user_id)
    end
    users.each do |u|

      u_daysum = []
      for i in 0..day_array_d.length-1
        u_daysum[i] = 0
      end
      u_weeksum = []
      w_weeksum = []
      for j in 0..week_array.length-1
        u_weeksum[j] = 0
        w_weeksum[j] = 0
      end
      u_monthsum = []
      w_monthsum = []
      for j in 0..month_array.length-1
        u_monthsum[j] = 0
        w_monthsum[j] = 0
      end

      # all workorders of user
      work = []
      accesses = Access.where("user_id=?", u.id)
      accesses.each do |ac|
        work << ac.workorder_id
      end
      workorders = Workorder.where(:id => work)
      workorders.each do |wo|

        w_daysum = []
        for i in 0..day_array_d.length-1
          w_daysum[i] = 0
          # usum[i] = usum[i] + sum[i]
        end

        found = false
        #read all plans of user, workorder 
        plans = Planning.where("workorder_id=? and user_id=?",wo.id, u.id)
        plans.each do |p|
          
          for i in 0..day_array_d.length-1

              # day planning
              plan_found = false
              if p.day > 0  
                compare_date = Date.new(p.year, p.month, p.day)
                # wenn Tag und kein Wechenende
                if compare_date == day_array_d[i] and day_array_d[i].strftime("%u").to_i <= 5
                  plan_found = true
                end
              end
  
              #week planning
              if p.week > 0 and p.day == 0
                # gleiche Woche & kein Wochenende
                if p.week == day_array_w[i] and day_array_d[i].strftime("%u").to_i <= 5
                  plan_found = true
                end
              end
  
              #month planning
              if p.month > 0 and p.week == 0 and p.day == 0
                # gleicher Monat & kein Wochenende
                if p.month == day_array_m[i] and day_array_d[i].strftime("%u").to_i <= 5
                  plan_found = true
                end
              end
  
              if plan_found == true
                w_daysum[i] = w_daysum[i] + p.percentage
                found = true
              end
          end
        end #next plan
          
        # wenn Pläne für User/Workorder gefunden  
        if found == true
          $row = $row + 1
          worksheet.write($row, 0, "company")
          worksheet.write($row, 1, u.lastname + " " + u.name)
          worksheet.write($row, 2, wo.name)
          
          # day view
          if $period == $period_options[2]
              for i in 0..day_array_d.length-1
                # # weekend
                if day_array_d[i].strftime("%u").to_i <= 5
                  if w_daysum[i] >0
                    worksheet.write($row, i+3, w_daysum[i], f_active)
                    u_daysum[i] = u_daysum[i] + w_daysum[i]
                  end
                else
                   worksheet.write($row, i+3, "",f_weekend)
                end
              end
          end
          
          # week view
          if $period == $period_options[1]
            # für alle Wochen
            for j in 0..week_array.length-1
              sum = 0
              count = 0
              for i in 0..day_array_w.length-1
                # alle items pro Woche summieren 
                if week_array[j].to_i == day_array_w[i].to_i and day_array_d[i].strftime("%u").to_i <= 5
                  count = count + 1
                  w_weeksum[j] = w_weeksum[j] + w_daysum[i]
                end
              end
              if w_weeksum[j] > 0
                w_weeksum[j] = (w_weeksum[j]/count).to_i
                u_weeksum[j] = u_weeksum[j] + w_weeksum[j]
                worksheet.write($row, j+3, w_weeksum[j],f_active)
              else
                worksheet.write($row, j+3, "",f_active)
              end
            end
          end
            
          # month view
          if $period == $period_options[0]
            # für alle Monate
            for j in 0..month_array.length-1
              sum = 0
              count = 0
              for i in 0..day_array_m.length-1
                # alle items pro Woche summieren 
                if month_array[j].to_i == day_array_m[i].to_i and day_array_d[i].strftime("%u").to_i <= 5
                  count = count + 1
                  w_monthsum[j] = w_monthsum[j] + w_daysum[i]
                end
              end
              if w_monthsum[j] > 0 
                w_monthsum[j] = (w_monthsum[j]/count).to_i 
                u_monthsum[j] = u_monthsum[j] + w_monthsum[j]
                worksheet.write($row, j+3, w_monthsum[j], f_active)
              else
                worksheet.write($row, j+3, "",f_active)
              end
            end
          end
        end
      end

      #finally write total lines
      $row = $row + 1
      worksheet.write($row, 0, "company")
      worksheet.write($row, 1, u.lastname + " " + u.name)
      worksheet.write($row, 2, "Total")

      # day view
      if $period == $period_options[2]
        for i in 0..day_array_d.length-1
          if day_array_d[i].strftime("%u").to_i <= 5
            write_usertotal(worksheet,i+3,u_daysum[i],f_danger, f_warning, f_success)
          else
            worksheet.write($row, i+3, "",f_weekend)
          end
        end
      end

      #week view
      if $period == $period_options[1]
        for j in 0..week_array.length-1
            write_usertotal(worksheet,j+3,u_weeksum[j],f_danger, f_warning, f_success)
        end
      end

      #month view
      if $period == $period_options[0]
        for j in 0..month_array.length-1
            write_usertotal(worksheet,j+3,u_monthsum[j].to_i,f_danger, f_warning, f_success)
        end
      end
    end
  end

  def write_usertotal(worksheet, col, value, f_danger, f_warning, f_success)
    if value > 0
      if value <= 40
          worksheet.write($row, col, value, f_danger)
      end 
      if value > 40 and value <=60
        worksheet.write($row, col, value,f_warning)
      end 
      if value > 60 and value <= 120
        worksheet.write($row, col, value,f_success)
      end 
      if value > 120
        worksheet.write($row, col, value,f_danger)
      end
    end
  end

end
