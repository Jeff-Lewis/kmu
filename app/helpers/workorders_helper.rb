module WorkordersHelper
    
   def anzahl(wo, bom, eom)
     return wo.timetracks.where("user_id=? and datum>=? and datum<=?", current_user.id, bom, eom).count
   end

end
