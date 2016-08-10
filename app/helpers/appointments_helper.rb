module AppointmentsHelper
    
    def AppItem(appointments, start)

        @anz_stunden = (@user.time_to - @user.time_from) +1
        @anz_tage = 7
        @array = Array.new(@anz_stunden) {Array.new(@anz_tage)}

        for stunde in 0..@anz_stunden-1
            for tag in 0..@anz_tage-1
                @array[stunde][tag] = 0
            end
        end
        
        appointments.each do |c|
            
            von = DateTime.new(c.date_from.year,c.date_from.month,c.date_from.day,c.time_from)
            bis = DateTime.new(c.date_to.year,c.date_to.month,c.date_to.day,c.time_to)
            
            for stunde in 0..@anz_stunden-1
                for tag in 0..@anz_tage-1

                    comp = DateTime.new((start+tag).year,(start+tag).month,(start+tag).day,@user.time_from+stunde)
                    
                    if comp >= von and comp < bis
                        @array[stunde][tag] = c.id
                    end

                end
            end
        end
        return @array
    end
    
end
