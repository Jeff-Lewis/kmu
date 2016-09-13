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

end    