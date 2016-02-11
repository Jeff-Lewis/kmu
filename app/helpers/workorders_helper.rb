module WorkordersHelper
    
    def wo_hierachy(workorder,j)
        if workorder > 0
            wo = Workorder.find(workorder)
            wo_hierachy(wo.parent_id, j+1)
            str = ""
            j.times do str << "=>" end
            puts str
            $wo_hierachy << wo.name
        else
            return $wo_hierachy
        end
    end
    
   def anzahl(wo, bom, eom)
     return wo.timetracks.where("user_id=? and datum>=? and datum<=?", $logon_user_id, bom, eom).count
   end

end
