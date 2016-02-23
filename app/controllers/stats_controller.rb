class StatsController < ApplicationController
      
  $start_date = Date.today.beginning_of_month
  $end_date = Date.today.end_of_month
  $company_id = 0
  $workorder_id = 0
  $include_sub = false
  $row = 0
  
  def user

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
      @workorders = Workorder.where("user_id=?", $logon_user_id)
      @timetracks = Timetrack.where("workorder_id=? and datum>=? and datum<=?", params[:workorder_id], params[:starting_date], params[:ending_date]).order(:datum)
      @tt1 = Timetrack.where("tandm=? and workorder_id=? and datum>=? and datum<=?", "TIME", params[:workorder_id], params[:starting_date], params[:ending_date]).order(:datum)
 
    if params[:data] == "WriteExcel" 
      # Create a new Excel Workbook
      $filename = "public/reports/ProMIS_" + DateTime.now.to_s + ".xls"
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
      f_header1.set_color('black')
      
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
      worksheet.write($row, col, "ProMIS Reporting " + DateTime.now.strftime("%d.%m.%y-%H:%M"), f_header0)
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
      @w = Workorder.find($workorder_id)
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
  
  def workorder
    @timetracks = Timetrack.all
    @people = User.all
    array = []
    for i in 0..100
      array << {"datum" => Date.today + i, "amount" => Math.sin(i)*100 }
    end
    @js = array
    puts @js
  end

end
