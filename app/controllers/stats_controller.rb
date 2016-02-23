class StatsController < ApplicationController
  
  # require 'spreadsheet'
      
  $start_date = Date.today.beginning_of_month
  $end_date = Date.today.end_of_month
  $workorder = ""
  
  def user

    @people = User.all
    @workorders = Workorder.all
    @timetracks = Timetrack.where("workorder_id=? and user_id=? and datum>=? and datum<=?", params[:workorder], params[:people], params[:starting_date], params[:ending_date]).order(:datum)
    @timetracks = Timetrack.all
    
    puts params[:data]
    if params[:data] == "WriteExcel" 
      
      # Create a new Excel Workbook
      filename = "ProMIS_" + Date.today.to_s + ".xls"
      workbook = WriteExcel.new(filename)
      
      # Add worksheet(s)
      worksheet  = workbook.add_worksheet

      # Add and define a format
      # format = workbook.add_format
      # format.set_bold
      # format.set_color('red')
      # format.set_align('right')
      
      # # write a formatted and unformatted string.
      # worksheet.write(1, 1, 'Hi Excel.', format)  # cell B2
      # worksheet.write(2, 1, 'Hi Excel.')          # cell B3
      
      # # write a number and formula using A1 notation
      # worksheet.write('B4', 3.14159)
      # worksheet.write('B5', '=SIN(B4/4)')
      
      # write to file
      

      row = 0
      col = 0
      worksheet.write(row, col, "Reporting Date")
      col = col + 1
      worksheet.write(row, col, "Company")
      col = col + 1
      worksheet.write(row, col, "Workorder")
      col = col + 1
      worksheet.write(row, col, "Workorder (costinfo1)")
      col = col + 1
      worksheet.write(row, col, "Workorder (costinfo2)")
      col = col + 1
      worksheet.write(row, col, "Employee")
      col = col + 1
      worksheet.write(row, col, "Employee (std cost rate)")
      col = col + 1
      worksheet.write(row, col, "Employee (workorder cost rate)")
      col = col + 1
      worksheet.write(row, col, "Employee (cost info1)")
      col = col + 1
      worksheet.write(row, col, "Employee (cost info2)")
      col = col + 1

      worksheet.write(row, col, "hours reported")
      col = col + 1
      worksheet.write(row, col, "costs reported")

      @timetracks.each do |tt|
        worksheet.write(row, 0, tt.datum)
        worksheet.write(row, 1, tt.workorder.company.name)
        worksheet.write(row, 2, tt.workorder.name)
        worksheet.write(row, 3, tt.workorder.costinfo1)
        worksheet.write(row, 4, tt.workorder.costinfo2)
        worksheet.write(row, 5, tt.user.lastname + " " + tt.user.name)
        worksheet.write(row, 6, tt.user.costrate)
        special_rates = Access.where("user_id=? and workorder_id=?", tt.user.id, tt.workorder.id)
        if special_rates.first != nil
          cr = special_rates.first.costrate
        else
          cr = tt.user.costrate 
        end
        if cr == nil
          cr = 0
        end
        worksheet.write(row, 7, cr)
        worksheet.write(row, 8, tt.user.costinfo1)
        worksheet.write(row, 9, tt.user.costinfo2)
        worksheet.write(row, 10, tt.amount)
        worksheet.write(row, 11, tt.amount * cr)
      
        row = row + 1
      end

      workbook.close
    end    
    
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet
    sheet1.row(0).concat %w{test1 test2 test3}
    sheet1.row(1).push 'item 1', 'item2', 'item3'
    book.write 'localhost:/downloads/ProMIS.xls'
    
    
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
