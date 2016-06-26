module ApplicationHelper
    
    def ticker
      if user_signed_in?
          ticker = " "
          
          # follow Tickets
          usertickets = UserTicket.where('user_id=? and status=?', current_user.id, "überreicht").last(3)
          usertickets.each do |ut|
            	 ticker = ticker + " Sie haben von " + ut.ticket.sponsor.company.name + " ein Ticket " + ut.ticket.name + " für " + ut.ticket.sponsor.event.name + " erhalten... " 
          end

          # follow User
          favourits = Favourit.where('user_id=? and object_name=?', current_user.id, 'User')
          favourits.each do |f|
             u=User.find(f.object_id)
             u.events.order(created_at: :desc).last(3).each do |ue|
            	 ticker = ticker + " neue Veranstaltung " + ue.name + " von " + u.name + " " + u.lastname + " "
             end
          end
          
          # follow Company
          favourits = Favourit.where('user_id=? and object_name=?', current_user.id, 'Company')
          favourits.each do |f|
             c=Company.find(f.object_id)
             c.events.order(created_at: :desc).last(3).each do |ce|
            	 ticker = ticker + " neue Veranstaltung " + ce.name + " von " + c.name + " " 
             end
          end
          
          # follow Spendeninitiative
          favourits = Favourit.where('user_id=? and object_name=?', current_user.id, 'Donation')
          favourits.each do |f|
             d=Donation.find(f.object_id)
             d.donation_stats.order(created_at: :desc).last(3).each do |ds|
                 if ds.company_id != nil
                	 spende = ds.company.name + " hat für " + d.name + " " + sprintf("%05.2f CHF",ds.amount) + " gespendet "
                 end
                 if ds.user_id != nil
                	 spende = ds.user.name + " " + ds.user.lastname + " hat für " + d.name + " " + sprintf("%05.2f CHF",ds.amount) + " gespendet "
                 end
                 ticker = ticker + spende
             end
          end
          
          return ticker
      end
    end

end
