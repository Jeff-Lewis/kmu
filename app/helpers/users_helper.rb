module UsersHelper

def align_text(txt)
    len = 30
    if txt == nil
        text = ""
    else
        if txt.length >= len
          text = txt[0,len]
        else
          text = txt
        end
    end
    return text + "..."
end

def build_medialist(md_string, items, cname, panel)
    
    if panel
        html_string = '<div class="panel-body">'
    else
        html_string =""
    end
        html_string = html_string + "<div class='row'>"
        items.each do |item|
            html_string = html_string + '<div class="' + md_string.to_s + '">'
                html_string = html_string + "<div class='media'>"
                    html_string = html_string + "<div class='media-left'>"
                        case cname
                            when "actions"
                                html_string = html_string + "<a href=/services/"+item.id.to_s+">"
                            else 
                                html_string = html_string + "<a href=/"+cname+"/"+item.id.to_s+">"
                        end
                        case items.table_name
                            when "requests"
                                html_string = html_string + carousel(item.request_details,"thumb")
                            when "hotspots"
                                html_string = html_string + carousel(item.hotspot_details,"thumb")
                            when "bids"
                                html_string = html_string + carousel(item.bid_details,"thumb")
                            when "events"
                                html_string = html_string + carousel(item.event_details,"thumb")
                            when "donations"
                                html_string = html_string + carousel(item.donation_details,"medium")
                            when "jobs"
                                if item.company.avatar_file_name
                                    html_string = html_string + (image_tag item.company.avatar(:thumb), class:'img-rounded')
                                else
                                    html_string = html_string + (image_tag 'company_a.png', :size => '50x50', class:'img-rounded')
                                end
                            else
                                if item.avatar_file_name
                                    html_string = html_string + (image_tag item.avatar(:thumb), class:'img-rounded')
                                else
                                    html_string = html_string + (image_tag 'user_a.png', :size => '50x50', class:'img-rounded')
                                end
                        end
                        html_string = html_string + "</a>"
                    html_string = html_string + "</div>"
                    html_string = html_string + "<div class='media-body'>"
                        if (Date.today - item.created_at.to_date).to_i < 2
                            html_string = html_string + (image_tag 'neu.png', :size => '30x30', class:'img-rounded')
                        else
#                            if item.updated_at.to_date == Date.today
#                                html_string = html_string + (image_tag 'update.jpg', :size => '30x30', class:'img-rounded')
#                            end
                        end 
                      case items.table_name
                      when "requests"
                          html_string = html_string + '<h4 class="media-heading">'+ item.name + "</h4>"
  					      if !item.social
          					  if item.price
    					        html_string = html_string + "<preiss><b>" + sprintf("%05.2f CHF", item.price) + "</b></preiss>"
    					      end
    					  else
    					      html_string = html_string + "<preiss><b><i class='glyphicon glyphicon-heart'></i></b></preiss>"
    					  end
                          html_string = html_string + "<br>"    					  
                          if item.date_to != nil
                              html_string = html_string + "<b><ntext>noch </ntext></b><restlaufzeits>" + (item.date_to.to_date - DateTime.now.to_date).to_i.to_s + "</restlaufzeits> <b><ntext> Tage</ntext></b>"
                          end
                          html_string = html_string + "<br>"    					  
                          if !item.user.anonymous
                            if item.user.avatar_file_name == nil
                              html_string = html_string + (image_tag "user_a.png", :size => "50x50", class:"img-rounded")
                            else
                              html_string = html_string + (image_tag item.user.avatar(:small), class:"img-rounded") + "<br>"
                              html_string = html_string + item.user.name + " " + item.user.lastname
                            end
                          end

                      when "users"
                          html_string = html_string + '<h4 class="media-heading">'+ item.name + " " + item.lastname + " "
                          if item.services.where("social=?",true).count > 0
                                html_string = html_string + "<i class='glyphicon glyphicon-heart'></i>"
                          end
                          html_string = html_string + "</h4>"
                          html_string = html_string + item.geo_address
                      when "companies"
                          html_string = html_string + '<h4 class="media-heading">'+ item.name + " "
                          if item.services.where("social=?",true).count > 0
                                html_string = html_string + "<i class='glyphicon glyphicon-heart'></i>"
                          end
                          html_string = html_string + "</h4>"
                          html_string = html_string + item.geo_address
                      when "services"
                          html_string = html_string + '<h4 class="media-heading">'+ item.name + "</h4>"
                          avg_rating(item.id).times do
                            html_string = html_string + "<i class='glyphicon glyphicon-star'></i>" 
                          end
                          if item.social
                            html_string = html_string + "<i class='glyphicon glyphicon-heart'></i>"+ " "
                          end
                          if item.company_id != nil
                              html_string = html_string + item.company.name + "<br>"
                          end
                          if item.user_id != nil
                              html_string = html_string + item.user.name + " "+ item.user.lastname + "<br>"
                          end
                          if item.date_to != nil
                            html_string = html_string + "<ntext>noch </ntext><restlaufzeits>" + (item.date_to.to_date - DateTime.now.to_date).to_i.to_s + "</restlaufzeits><ntext> Tage</ntext><br>"
                          end
                      when "bids"
                          html_string = html_string + '<h4 class="media-heading">'+ item.name + "</h4>"
                          if item.user_id != nil
                              html_string = html_string + item.user.name + " "+ item.user.lastname + "<br>"
                          end
                          if item.date_to != nil
                            html_string = html_string + "<ntext>noch </ntext><restlaufzeits>" + (item.date_to.to_date - DateTime.now.to_date).to_i.to_s + "</restlaufzeits><ntext> Tage</ntext><br>"
                          end
                      when "events"
                          html_string = html_string + '<h4 class="media-heading">'+ item.name + "</h4>"
                          if item.company_id != nil
                              html_string = html_string + item.company.name
                          end
                          if item.user_id != nil
                              html_string = html_string + item.user.name + " "+ item.user.lastname
                          end
                          html_string = html_string + "<br>"
                          if item.date_to != nil
                            html_string = html_string + "<ntext>noch </ntext><restlaufzeits>" + (item.date_to.to_date - DateTime.now.to_date).to_i.to_s + "</restlaufzeits><ntext> Tage</ntext><br>"
                          end
                          if item.sponsors.count > 0
                            html_string = html_string + "Sponsoren:<br>"
                          end
                          item.sponsors.each do |s|
                            html_string = html_string + (image_tag s.company.avatar(:small), class:'img-rounded')
                          end

                      when "vehicles"
                          html_string = html_string + '<h4 class="media-heading">'+ item.name + " "
                          html_string = html_string + "</h4>"
                          if item.company_id != nil
                              html_string = html_string + item.company.name
                          end
                          if item.user_id != nil
                              html_string = html_string + item.user.name + " "+ item.user.lastname
                          end
                      when "jobs"
                          html_string = html_string + '<h4 class="media-heading">'+ item.name + " "
                          html_string = html_string + "</h4>"
                          if item.company_id != nil
                              html_string = html_string + item.company.name + "<br>"
                              html_string = html_string + item.company.category.name
                          end
                      when "hotspots"
                          HsRating.avg_rating(item).to_i.times do
                            html_string = html_string + "<i class='glyphicon glyphicon-star'></i>" + " "
                          end
                          html_string = html_string + '<h4 class="media-heading">'+ item.name + " "
                          html_string = html_string + "</h4>"
                          html_string = html_string + item.user.name + " "+ item.user.lastname
                      when "donations"
                          if item.date_to != nil
                              html_string = html_string + "<b><ntext>noch </ntext></b><restlaufzeits>" + (item.date_to.to_date - DateTime.now.to_date).to_i.to_s + "</restlaufzeits> <b><ntext> Tage</ntext></b>"
                          end
                          html_string = html_string + '<h4 class="media-heading">'+ item.name + " "
                          html_string = html_string + "</h4>"
                          if item.company_id
                              html_string = html_string + item.company.name
                          end
                          if item.user_id
                              html_string = html_string + item.user.name + " " + item.user.lastname
                          end
                          soll = item.amount
                          if item.donation_stats != nil
                            ist  = item.donation_stats.sum(:amount)
                          else
                            ist = 0
                          end
                          if item.dtype == "Donation"
                              html_string = html_string + "<br>Spendenstand<br>"
                          end
                          if item.dtype == "Reward"
                              html_string = html_string + "<br>Stand Unterstützung<br>"
                          end
                          if item.dtype == "Loan"
                              html_string = html_string + "<br>Stand Kreditsumme<br>"
                          end
                          html_string = html_string + "<preiss>" + sprintf("%05.2f CHF",ist) + "</preiss><br>"
                          html_string = html_string + '<div class="progress">'
                              html_string = html_string + '<div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="' + ist.to_s + '" aria-valuemin="0" aria-valuemax="' + soll.to_s + '" style="width: ' + (ist/soll*100).to_s + '%">'
                                  html_string = html_string + '<span class="sr-only">40% Complete (success)</span>'
                              html_string = html_string + "</div>"
                          html_string = html_string + "</div>"
                          if item.dtype == "Reward"
                              if item.price > 0 
                                  if ist > 0
                                      anz = ((item.amount-ist)/item.price).to_i
                                  else
                                      anz = (item.amount/item.price).to_i
                                  end
                              else
                                  anz = 0
                              end
                              html_string = html_string + "noch "+ anz.to_s + " Unterstützer gesucht"
                          end
                      end
                    html_string = html_string + "</div>"
                html_string = html_string + "<br></div>"
            html_string = html_string + "</div>"
        end
        html_string = html_string + "</div>"
    if panel
        html_string = html_string + "</div>"
    end
    html_string.html_safe
end

def showImage(type, size, item)
    case size
        when :small
            si = "50x50"
        when :thumb
            si = "100x100"
        when :medium
            si = "200x200"
        when :big
            si = "500x500"
    end
    link_to(item) do
        if item.avatar_file_name
            image_tag item.avatar(size), class:"img-rounded"
        else
            case type
                when "Service"
                    image_tag("service_a.png", :size => si, class:"img-rounded" )
            end
        end
    end
end

def header(header)
    html_string = "<div class='col-xs-12'><div class='panel-heading header'><li_header>" + header + "</li_header></div></div>"
    return html_string.html_safe
end

def navigate(item)
    si = "100x100"
    html_string = "<div class='col-xs-12'><div class='panel-body'>"
    if item
      html_string = html_string + link_to(home_index6_path :topic => "User") do
        content_tag(:i, nil, class:"btn btn-lg btn-active glyphicon glyphicon-user")
      end
    end
    html_string = html_string + link_to(home_index6_path :topic => "Kundenberater") do
        if item.advisors.count > 0
            content_tag(:i, nil, class:"btn btn-lg btn-active glyphicon glyphicon-question-sign")
        else
            content_tag(:i, nil, class:"btn btn-lg btn-passive glyphicon glyphicon-question-sign")
       end
    end
    html_string = html_string + link_to(home_index6_path :topic => "Service") do
    if item.services.count > 0
            content_tag(:i, nil, class:"btn btn-lg btn-active glyphicon glyphicon-shopping-cart")
        else
            content_tag(:i, nil, class:"btn btn-lg btn-passive glyphicon glyphicon-shopping-cart")
       end
    end
    html_string = html_string + link_to(home_index6_path :topic => "Company") do
    if item.companies.count > 0
            content_tag(:i, nil, class:"btn btn-lg btn-active glyphicon glyphicon-copyright-mark")
        else
            content_tag(:i, nil, class:"btn btn-lg btn-passive glyphicon glyphicon-copyright-mark")
       end
    end
    html_string = html_string + link_to(home_index6_path :topic => "Request") do
    if item.requests.count > 0
            content_tag(:i, nil, class:"btn btn-lg btn-active glyphicon glyphicon-pushpin")
        else
            content_tag(:i, nil, class:"btn btn-lg btn-passive glyphicon glyphicon-pushpin")
       end
    end
    html_string = html_string + link_to(home_index6_path :topic => "Vehicle") do
    if item.vehicles.count > 0
            content_tag(:i, nil, class:"btn btn-lg btn-active glyphicon glyphicon-road")
        else
            content_tag(:i, nil, class:"btn btn-lg btn-passive glyphicon glyphicon-road")
       end
    end
    html_string = html_string + link_to(home_index6_path :topic => "Event") do
    if item.events.count > 0
            content_tag(:i, nil, class:"btn btn-lg btn-active glyphicon glyphicon-calendar")
        else
            content_tag(:i, nil, class:"btn btn-lg btn-passive glyphicon glyphicon-calendar")
       end
    end
    html_string = html_string + link_to(home_index6_path :topic => "Ticket") do
    if item.user_tickets.count > 0
            content_tag(:i, nil, class:"btn btn-lg btn-active glyphicon glyphicon-barcode")
        else
            content_tag(:i, nil, class:"btn btn-lg btn-passive glyphicon glyphicon-barcode")
       end
    end
    html_string = html_string + link_to(home_index6_path :topic => "Hotspot") do
    if item.hotspots.count > 0
            content_tag(:i, nil, class:"btn btn-lg btn-active glyphicon glyphicon-camera")
        else
            content_tag(:i, nil, class:"btn btn-lg btn-passive glyphicon glyphicon-camera")
       end
    end
    html_string = html_string + link_to(home_index6_path :topic => "Bid") do
    if item.bids.count > 0
            content_tag(:i, nil, class:"btn btn-lg btn-active glyphicon glyphicon-pencil")
        else
            content_tag(:i, nil, class:"btn btn-lg btn-passive glyphicon glyphicon-pencil")
       end
    end
    html_string = html_string + link_to(home_index6_path :topic => "Reward") do
    if item.donations.where('dtype=?',"Reward").count > 0
            content_tag(:i, nil, class:"btn btn-lg btn-active glyphicon glyphicon-gift")
        else
            content_tag(:i, nil, class:"btn btn-lg btn-passive glyphicon glyphicon-gift")
       end
    end
    html_string = html_string + link_to(home_index6_path :topic => "Loan") do
    if item.donations.where('dtype=?',"Loan").count > 0
            content_tag(:i, nil, class:"btn btn-lg btn-active glyphicon glyphicon-refresh")
        else
            content_tag(:i, nil, class:"btn btn-lg btn-passive glyphicon glyphicon-refresh")
       end
    end
    html_string = html_string + link_to(home_index6_path :topic => "Stat") do
    if item.donation_stats.count > 0
            content_tag(:i, nil, class:"btn btn-lg btn-active glyphicon glyphicon-fullscreen")
        else
            content_tag(:i, nil, class:"btn btn-lg btn-passive glyphicon glyphicon-fullscreen")
       end
    end
    html_string = html_string + link_to(home_index6_path :topic => "Rating") do
    if item.ratings.count > 0
            content_tag(:i, nil, class:"btn btn-lg btn-active glyphicon glyphicon-star")
        else
            content_tag(:i, nil, class:"btn btn-lg btn-passive glyphicon glyphicon-star")
       end
    end
    html_string = html_string + link_to(home_index6_path :topic => "Favourit") do
    if item.favourits.count > 0
            content_tag(:i, nil, class:"btn btn-lg btn-active glyphicon glyphicon-heart")
        else
            content_tag(:i, nil, class:"btn btn-lg btn-passive glyphicon glyphicon-heart")
       end
    end
    html_string = html_string + link_to(home_index6_path :topic => "Customer") do
    if Customer.where('user_id=?',item.id).count > 0
            content_tag(:i, nil, class:"btn btn-lg btn-active glyphicon glyphicon-tag")
        else
            content_tag(:i, nil, class:"btn btn-lg btn-passive glyphicon glyphicon-tag")
       end
    end
    html_string = html_string + link_to(home_index6_path :topic => "Transaction") do
    if item.transactions.count > 0
            content_tag(:i, nil, class:"btn btn-lg btn-active glyphicon glyphicon-list")
        else
            content_tag(:i, nil, class:"btn btn-lg btn-passive glyphicon glyphicon-list")
       end
    end
    html_string = html_string + link_to(home_index6_path :topic => "Location") do
    if item.geo_address
            content_tag(:i, nil, class:"btn btn-lg btn-active glyphicon glyphicon-record")
        else
            content_tag(:i, nil, class:"btn btn-lg btn-passive glyphicon glyphicon-record")
       end
    end
    
    html_string = html_string + "</div></div>"
    return html_string.html_safe
    
end

def action_buttons(item, topic)
    
    html_string = "<div class='col-xs-12'><div class='panel-body'>"
    
    html_string = html_string + link_to(users_path :page => session[:page]) do
      content_tag(:i, nil, class: "btn btn-primary btn-lg glyphicon glyphicon-list")
    end
    if user_signed_in?
      html_string = html_string + link_to(new_favourit_path :object_name => "User", :object_id => @user.id, :user_id => current_user.id) do
        content_tag(:i, nil, class: "btn btn-primary btn-lg glyphicon glyphicon-star")
      end
      if current_user.id == item.id or current_user.superuser
          html_string = html_string + link_to(edit_user_path(item)) do
          content_tag(:i, nil, class: "btn btn-primary btn-lg glyphicon glyphicon-wrench")
        end
        html_string = html_string + link_to(appointments_path :user_id1 => item.id) do
            content_tag(:i, nil, class: "btn btn-primary btn-lg glyphicon glyphicon-calendar")
        end
          html_string = html_string + link_to(item, method: :delete, data: { confirm: 'Are you sure?' }) do
            content_tag(:i, nil, class: "btn btn-danger btn-lg pull-right glyphicon glyphicon-trash")
        end
      end
      html_string = html_string + link_to(new_webmaster_path :object_name => "User", :object_id => item.id, :user_id => current_user.id) do
        content_tag(:i, nil, class: "btn btn-warning btn-lg pull-right glyphicon glyphicon-eye-open")
      end
      html_string = html_string + link_to(listaccounts_index_path :user_id => current_user.id, :user_id_ver => item.id, :company_id_ver => nil, :ref => "Vergütung an "+item.name + " " + item.lastname, :object_name => "User", :object_id => item.id, :amount => nil) do
        content_tag(:i, nil, class: "btn btn-primary btn-lg glyphicon glyphicon-euro")
      end
    end

    case topic
        when "Service"
          if user_signed_in?
            if current_user.id == item.id
              html_string = html_string + link_to(new_service_path :user_id => item.id, :stype => "regular") do
                content_tag(:i, nil, class:"btn btn-primary btn-lg glyphicon glyphicon-plus")
              end
            end
          end
          
        when "Company"
          if user_signed_in?
            if current_user.id == item.id
              html_string = html_string + link_to(new_company_path :user_id => item.id) do
                content_tag(:i, nil, class:"btn btn-primary btn-lg glyphicon glyphicon-plus")
              end
            end
          end

        when "Request"
          if user_signed_in?
            if current_user.id == item.id
              html_string = html_string + link_to(new_request_path :user_id => item.id) do
                content_tag(:i, nil, class:"btn btn-primary btn-lg glyphicon glyphicon-plus")
              end
            end
          end

        when "Vehicle"
          if user_signed_in?
            if current_user.id == item.id
              html_string = html_string + link_to(new_vehicle_path :user_id => item.id) do
                content_tag(:i, nil, class:"btn btn-primary btn-lg glyphicon glyphicon-plus")
              end
            end
          end

        when "Event"
          if user_signed_in?
            if current_user.id == item.id
              html_string = html_string + link_to(new_event_path :user_id => item.id) do
                content_tag(:i, nil, class:"btn btn-primary btn-lg glyphicon glyphicon-plus")
              end
            end
          end

        when "Tickets"
          if user_signed_in?
            found = false
            com = Company.where('user_id=?',current_user.id)
            com.each do |c|
              c.sponsors.each do |sp|
                if sp.tickets.where('active=?','t').count > 0
                  found = true
                end
              end
            end
            if found
              html_string = html_string + link_to(ticketuserview_index2_path :user_id => item.id) do
                content_tag(:i, nil, class:"btn btn-primary btn-lg glyphicon glyphicon-plus")
              end
            end
          end

        when "Hotspot"
          if user_signed_in?
            if current_user.id == item.id
              html_string = html_string + link_to(new_hotspot_path :user_id => item.id) do
                content_tag(:i, nil, class:"btn btn-primary btn-lg glyphicon glyphicon-plus")
              end
            end
          end

        when "Bid"
          if user_signed_in?
            if current_user.id == item.id
              html_string = html_string + link_to(new_bid_path :user_id => item.id) do
                content_tag(:i, nil, class:"btn btn-primary btn-lg glyphicon glyphicon-plus")
              end
            end
          end

        when "Reward"
          if user_signed_in?
            if current_user.id == item.id
              html_string = html_string + link_to(new_donation_path :user_id => item.id, :dtype => "Reward") do
                content_tag(:i, nil, class:"btn btn-primary btn-lg glyphicon glyphicon-plus")
              end
            end
          end

        when "Loan"
          if user_signed_in?
            if current_user.id == item.id
              html_string = html_string + link_to(new_donation_path :user_id => item.id, :dtype => "Loan") do
                content_tag(:i, nil, class:"btn btn-primary btn-lg glyphicon glyphicon-plus")
              end
            end
          end

    end
    html_string = html_string + "</div></div>"
    return html_string.html_safe
end

end    