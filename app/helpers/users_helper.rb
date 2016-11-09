module UsersHelper
  
def carousel2(scope, size)
    html = ""
    if scope.first == nil
      html = html + (image_tag "no_pic.jpg", :size => size, class:"img-rounded")
    
    else
      if scope.count == 0
        html = html + (image_tag "no_pic.jpg", :size => size, class:"img-rounded")
  
      else
  
        html = html +  "<ul class='bxslider'>"
        scope.each do |p|
        	if p.avatar_file_name == nil
            html = html + (image_tag "no_pic.jpg", :size => size, class:"img-rounded")
          else
            html = html + (image_tag p.avatar(size), class:"img-rounded")
          end
        end
        html = html +  "</ul>"
  
      end
    end
    return html.html_safe
end

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
                                html_string = html_string + showFirstImage(:small, item, item.request_details)
                                #html_string = html_string + carousel2(item.request_details,:small)
                            when "hotspots"
                                html_string = html_string + showFirstImage(:small,item, item.hotspot_details)
                                #html_string = html_string + carousel2(item.hotspot_details,:small)
                            when "bids"
                                html_string = html_string + showFirstImage(:small, item, item.bid_details)
                                #html_string = html_string + carousel2(item.bid_details,:small)
                            when "events"
                                html_string = html_string + showFirstImage(:small, item, item.event_details)
                                #html_string = html_string + carousel2(item.event_details,:small)
                            when "donations"
                                html_string = html_string + showFirstImage(:small, item, item.donation_details)
                                #html_string = html_string + carousel2(item.donation_details,:small)
                            when "jobs"
                                if item.company.avatar_file_name
                                    html_string = html_string + (image_tag item.company.avatar(:small), class:'img-rounded')
                                else
                                    html_string = html_string + (image_tag 'company_a.png', :size => '50x50', class:'img-rounded')
                                end
                            else
                                if item.avatar_file_name
                                    html_string = html_string + (image_tag item.avatar(:small), class:'img-rounded')
                                else
                                    html_string = html_string + (image_tag 'user_a.png', :size => '50x50', class:'img-rounded')
                                end
                        end
                        html_string = html_string + "</a>"
                    html_string = html_string + "</div>"
                    html_string = html_string + "<div class='media-body'>"
                        if (Date.today - item.created_at.to_date).to_i < 5
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
                          #html_string = html_string + "<br>"    					  
                          #if !item.user.anonymous
                          #  if item.user.avatar_file_name == nil
                          #    html_string = html_string + (image_tag "user_a.png", :size => "50x50", class:"img-rounded")
                          #  else
                          #    html_string = html_string + (image_tag item.user.avatar(:small), class:"img-rounded") + "<br>"
                          #    html_string = html_string + item.user.name + " " + item.user.lastname
                          #  end
                          #end

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
                          #if item.sponsors.count > 0
                          #  html_string = html_string + "Sponsoren:<br>"
                          #end
                          #item.sponsors.each do |s|
                          #  html_string = html_string + (image_tag s.company.avatar(:small), class:'img-rounded')
                          #end

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

def build_medialist2(items, cname)
  html_string = "<br>"
  
  items.each do |item|

    html_string = html_string + '<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4 ">'
        html_string = html_string + '<div class="row">'
            html_string = html_string + '<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">'
                html_string = html_string + '<div class="panel panel-default" onclick="return init_map(0);">'
                    html_string = html_string + '<div class="row padall">'
                      html_string = html_string + '<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">'
                          html_string = html_string + '<span></span>'
                          case items.table_name
                            when "users", "companies", "services", "vehicles"
                              html_string = html_string + showImage2(:medium, item)
                            when "bids"
                              html_string = html_string + showFirstImage2(:medium, item, item.bid_details)                              
                            when "jobs"
                              html_string = html_string + showImage2(:medium, item.company)
                            when "events"
                              html_string = html_string + showFirstImage2(:medium, item, item.event_details)                              
                            when "hotspots"
                              html_string = html_string + showFirstImage2(:medium, item, item.hotspot_details)                              
                            when "requests"
                              html_string = html_string + showFirstImage2(:medium, item, item.request_details)                              
                            when "donations"
                              html_string = html_string + showFirstImage2(:medium, item, item.donation_details)                              
                          end
                      html_string = html_string + "</div>"
                      html_string = html_string + '<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">'
                        html_string = html_string + '<div class="clearfix">'
                            html_string = html_string + '<div class="pull-left">'
                              if (Date.today - item.created_at.to_date).to_i < 5
                                  html_string = html_string + (image_tag 'neu.png', :size => '30x30', class:'img-rounded')
                              end 
                              case items.table_name
                                  when "users"
                                    html_string = html_string + '<list-h1>' + item.name + " " + item.lastname + '<br></list-h1><br>'
                                    html_string = html_string + '<i class="glyphicon glyphicon-map-marker"></i>'
                                    html_string = html_string + " " + item.geo_address + '<br>'
                                    html_string = html_string + '<i class="glyphicon glyphicon-envelope"></i>'
                                    html_string = html_string + " " + item.email + '<br>'
                                  when "companies"
                                    html_string = html_string + '<list-h1>' + item.name + '<br></list-h1><br>'
                                    html_string = html_string + '<i class="glyphicon glyphicon-folder-open"></i>'
                                    html_string = html_string + " " + item.category.name + '<br>'
                                    html_string = html_string + '<i class="glyphicon glyphicon-map-marker"></i>'
                                    html_string = html_string + " " + item.geo_address + '<br>'
                                    html_string = html_string + '<i class="glyphicon glyphicon-envelope"></i>'
                                    html_string = html_string + " " + item.user.email + '<br>'
                                  when "services"
                                    if item.social
                                      html_string = html_string + "<i class='glyphicon glyphicon-heart'></i>"+ " "
                                    end
                                    html_string = html_string + '<list-h1>' + item.name + '<br></list-h1><br>'
                                    if item.company_id != nil
                                        html_string = html_string + '<i class="glyphicon glyphicon-copyright-mark"></i>'
                                        html_string = html_string + " " + item.company.name + "<br>"
                                    end
                                    if item.user_id != nil
                                        html_string = html_string + '<i class="glyphicon glyphicon-user"></i>'
                                        html_string = html_string + " " + item.user.name + " "+ item.user.lastname + "<br>"
                                    end
                                    if item.date_to != nil
                                      html_string = html_string + "<i class='glyphicon glyphicon-time'></i>"+ " "
                                      html_string = html_string + "<ntext>noch </ntext><restlaufzeits>" + (item.date_to.to_date - DateTime.now.to_date).to_i.to_s + "</restlaufzeits><ntext> Tage</ntext><br>"
                                    end
                                  when "vehicles"
                                    html_string = html_string + '<list-h1>' + item.name + '<br></list-h1><br>'
                                    html_string = html_string + '<i class="glyphicon glyphicon-folder-open"></i>'
                                    html_string = html_string + " " + item.mob_category.name + '<br>'
                                    if item.company_id != nil
                                        html_string = html_string + '<i class="glyphicon glyphicon-copyright-mark"></i>'
                                        html_string = html_string + " " + item.company.name + "<br>"
                                    end
                                    if item.user_id != nil
                                        html_string = html_string + '<i class="glyphicon glyphicon-user"></i>'
                                        html_string = html_string + " " + item.user.name + " "+ item.user.lastname + "<br>"
                                    end

                                  when "bids"
                                    html_string = html_string + '<list-h1>' + item.name + '<br></list-h1><br>'
                                    html_string = html_string + '<i class="glyphicon glyphicon-folder-open"></i>'
                                    html_string = html_string + " " + item.category.name + '<br>'
                                    if item.user_id != nil
                                        html_string = html_string + '<i class="glyphicon glyphicon-user"></i>'
                                        html_string = html_string + " " + item.user.name + " "+ item.user.lastname + "<br>"
                                    end
                                    if item.date_to != nil
                                      html_string = html_string + "<i class='glyphicon glyphicon-time'></i>"+ " "
                                      html_string = html_string + "<ntext>noch </ntext><restlaufzeits>" + (item.date_to.to_date - DateTime.now.to_date).to_i.to_s + "</restlaufzeits><ntext> Tage</ntext><br>"
                                    end

                                  when "jobs"
                                    html_string = html_string + '<list-h1>' + item.name + '<br></list-h1><br>'
                                    html_string = html_string + '<i class="glyphicon glyphicon-folder-open"></i>'
                                    html_string = html_string + " " + item.company.category.name + '<br>'
                                    html_string = html_string + '<i class="glyphicon glyphicon-copyright-mark"></i>'
                                    html_string = html_string + " " + item.company.name + "<br>"
                                    if item.date_from != nil
                                      html_string = html_string + "<i class='glyphicon glyphicon-time'></i>"+ " ab "
                                      html_string = html_string + item.date_from.strftime("%d.%m.%Y") +"<br>"
                                    end
                                    if item.date_to != nil
                                      html_string = html_string + "<i class='glyphicon glyphicon-time'></i>"+ " befristet bis "
                                      html_string = html_string + item.date_to.strftime("%d.%m.%Y") +"<br>"
                                    end

                                  when "events"
                                    html_string = html_string + '<list-h1>' + item.name + '<br></list-h1><br>'
                                    html_string = html_string + '<i class="glyphicon glyphicon-folder-open"></i>'
                                    html_string = html_string + " " + item.ev_category.name + '<br>'
                                    if item.company_id != nil
                                        html_string = html_string + '<i class="glyphicon glyphicon-copyright-mark"></i>'
                                        html_string = html_string + " " + item.company.name + "<br>"
                                    end
                                    if item.user_id != nil
                                        html_string = html_string + '<i class="glyphicon glyphicon-user"></i>'
                                        html_string = html_string + " " + item.user.name + " "+ item.user.lastname + "<br>"
                                    end
                                    if item.date_to != nil
                                      html_string = html_string + "<i class='glyphicon glyphicon-time'></i>"+ " "
                                      html_string = html_string + "<ntext>noch </ntext><restlaufzeits>" + (item.date_to.to_date - DateTime.now.to_date).to_i.to_s + "</restlaufzeits><ntext> Tage</ntext><br>"
                                    end

                                  when "hotspots"
                                    html_string = html_string + '<list-h1>' + item.name + '<br></list-h1><br>'
                                    html_string = html_string + '<i class="glyphicon glyphicon-folder-open"></i>'
                                    html_string = html_string + " " + item.hs_category.name + '<br>'
                                    if item.user_id != nil
                                        html_string = html_string + '<i class="glyphicon glyphicon-user"></i>'
                                        html_string = html_string + " " + item.user.name + " "+ item.user.lastname + "<br>"
                                    end

                                  when "requests"
                                    html_string = html_string + '<list-h1>' + item.name + '<br></list-h1><br>'
                                    if item.user_id != nil
                                        html_string = html_string + '<i class="glyphicon glyphicon-user"></i>'
                                        html_string = html_string + " " + item.user.name + " "+ item.user.lastname + "<br>"
                                    end
                    					      if !item.social
                            					  if item.price
                        					        html_string = html_string + "<preiss><b>" + sprintf("%05.2f CHF", item.price) + "</b></preiss>"
                        					      end
                        					   else
                      					      html_string = html_string + "<preiss><b><i class='glyphicon glyphicon-heart'></i></b></preiss>"
                        					  end
                                    html_string = html_string + "<br>"    					  
                                    if item.date_to != nil
                                      html_string = html_string + "<i class='glyphicon glyphicon-time'></i>"+ " "
                                      html_string = html_string + "<ntext>noch </ntext><restlaufzeits>" + (item.date_to.to_date - DateTime.now.to_date).to_i.to_s + "</restlaufzeits><ntext> Tage</ntext><br>"
                                    end

                                  when "donations"
                                    html_string = html_string + '<list-h1>' + item.name + '<br></list-h1><br>'
                                    if item.date_to != nil
                                      html_string = html_string + "<i class='glyphicon glyphicon-time'></i>"+ " "
                                      html_string = html_string + "<ntext>noch </ntext><restlaufzeits>" + (item.date_to.to_date - DateTime.now.to_date).to_i.to_s + "</restlaufzeits><ntext> Tage</ntext><br>"
                                    end
                                    if item.company_id != nil
                                        html_string = html_string + '<i class="glyphicon glyphicon-copyright-mark"></i>'
                                        html_string = html_string + " " + item.company.name + "<br>"
                                    end
                                    if item.user_id != nil
                                        html_string = html_string + '<i class="glyphicon glyphicon-user"></i>'
                                        html_string = html_string + " " + item.user.name + " "+ item.user.lastname + "<br>"
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
                        html_string = html_string + "</div>"
                      html_string = html_string + "</div>"
                    html_string = html_string + "</div>"
                html_string = html_string + '<div class="panel panel-list nopadding" onclick="return init_map(0);">'
                  html_string = html_string + '<div class="list-banner">'
                    html_string = html_string + item.created_at.strftime("%d.%m.%Y")
                    #html_string = html_string + item.name
                    if cname == "actions"
                        html_string = html_string + "<a href=/services/"+item.id.to_s + ">"
                    else 
                        html_string = html_string + "<a href=/"+cname+"/"+item.id.to_s + ">"
                    end
                    html_string = html_string + '<i class="glyphicon glyphicon-circle-arrow-right pull-right"></i>'
                    html_string = html_string + "</a>"
                  html_string = html_string + "</div>"
                html_string = html_string + "</div>"
                html_string = html_string + "</div>"
            html_string = html_string + "</div>"
        html_string = html_string + "</div>"
    html_string = html_string + "</div>"
  end
  return html_string.html_safe
end

def showFirstImage(size, item, details)
    if details.count > 0
      pic = details.first
      link_to(item) do
          if pic.avatar_file_name
              image_tag pic.avatar(size), class:"img-rounded"
          else
              image_tag("no_pic.jpg", :size => size, class:"img-rounded" )
          end
      end
    else
      image_tag("no_pic.jpg", :size => size, class:"img-rounded" )
    end
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
                else
                    image_tag("no_pic.jpg", :size => si, class:"img-rounded" )
            end
        end
    end
end

def showFirstImage2(size, item, details)
    if details.count > 0
      pic = details.first
      if pic.avatar_file_name
          image_tag pic.avatar(size), class:"img-rounded"
      else
          image_tag("no_pic.jpg", :size => size, class:"img-rounded" )
      end
    else
      image_tag("no_pic.jpg", :size => size, class:"img-rounded" )
    end
end

def showImage2(size, item)
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
    if item.avatar_file_name
        image_tag item.avatar(size), class:"card-img-top img-responsive"
    else
        image_tag("no_pic.jpg", :size => si, class:"card-img-top img-responsive" )
    end
end

def header(header, format)
    if format
      html_string = "<div class='col-xs-12'><div class='panel-heading header'><li_header>" + header + "</li_header></div></div>"
    else
      html_string = "<div class='panel-heading header'><li_header>" + header + "</li_header></div>"
    end
    return html_string.html_safe
end

def navigate(object,item)
    
    html_string = "<navigate><div class='col-xs-12'><div class='panel-body'>"
    html_string = "<navigate>"
    
    case object
      when "User"
        html_string = html_string + build_nav("User",item,"User","user",item)
        html_string = html_string + build_nav("User",item,"Kundenberater","question-sign",item.advisors.count > 0)
        html_string = html_string + build_nav("User",item,"Userkalender","calendar",Appointment.where('user_id1=? or user_id2=?',item,item).count > 0)
        html_string = html_string + build_nav("User",item,"Service","shopping-cart",item.services.count > 0)
        html_string = html_string + build_nav("User",item,"Company","copyright-mark",item.companies.count > 0)
        html_string = html_string + build_nav("User",item,"Request","pushpin",item.requests.count > 0)
        html_string = html_string + build_nav("User",item,"Vehicle","retweet",item.vehicles.count > 0)
        html_string = html_string + build_nav("User",item,"Event","glass",item.events.count > 0)
        html_string = html_string + build_nav("User",item,"Ticket","barcode",item.user_tickets.count > 0)
        html_string = html_string + build_nav("User",item,"Hotspot","camera",item.hotspots.count > 0)
        html_string = html_string + build_nav("User",item,"Bid","pencil",item.bids.count > 0)
        html_string = html_string + build_nav("User",item,"Reward","gift", item.donations.where('dtype=?',"Reward").count > 0)
        html_string = html_string + build_nav("User",item,"Loan","signal", item.donations.where('dtype=?',"Loan").count > 0)
        html_string = html_string + build_nav("User",item,"Stat","tree-deciduous", item.donation_stats.count > 0)
        html_string = html_string + build_nav("User",item,"Rating","star-empty", item.ratings.count > 0)
        html_string = html_string + build_nav("User",item,"Favourit","star", item.favourits.count > 0)
        html_string = html_string + build_nav("User",item,"FavouritMap","globe", item.favourits.count)
        html_string = html_string + build_nav("User",item,"MyMap","globe", item.user_positions.count>0)
        html_string = html_string + build_nav("User",item,"Customer","check", Customer.where('user_id=?',item.id).count > 0)
        html_string = html_string + build_nav("User",item,"Transaction","list", Transaction.where('ttype=? and user_id=?', "Payment", item.id).count > 0)
        html_string = html_string + build_nav("User",item,"Location","record", item.geo_address)
        html_string = html_string + build_nav("User",item,"Email","envelope", Email.where('m_to=? or m_from=?', item.id, item.id).count > 0)
      
      when "Company"
        html_string = html_string + build_nav("Company",item,"Company","copyright-mark",item)
        html_string = html_string + build_nav("Company",item,"Service","shopping-cart",item.services.where("stype=?","regular").count > 0)
        html_string = html_string + build_nav("Company",item,"Aktion","time",item.services.where("stype=?","action").count > 0)
        html_string = html_string + build_nav("Company",item,"Vehicle","retweet",item.vehicles.count > 0)
        html_string = html_string + build_nav("Company",item,"Bid","pencil",item.bid_documents.count > 0)
        html_string = html_string + build_nav("Company",item,"Job","briefcase",item.jobs.count > 0)
        html_string = html_string + build_nav("Company",item,"Event","glass",item.events.count > 0)
        html_string = html_string + build_nav("Company",item,"Sponsor","certificate",item.sponsors.count > 0)
        html_string = html_string + build_nav("Company",item,"Donation","heart",item.donations.where('dtype=?',"Donation").count > 0)
        html_string = html_string + build_nav("Company",item,"Reward","gift",item.donations.where('dtype=?',"Reward").count > 0)
        html_string = html_string + build_nav("Company",item,"Loan","signal",item.donations.where('dtype=?',"Loan").count > 0)
        html_string = html_string + build_nav("Company",item,"Stat","tree-deciduous", item.donation_stats.count > 0)
        html_string = html_string + build_nav("Company",item,"Favourit","star", item.user.favourits.count > 0)
        html_string = html_string + build_nav("Company",item,"Customer","check", Customer.where('company_id=?',item.id).count > 0)
        html_string = html_string + build_nav("Company",item,"Transaction","list", Transaction.where('ttype=? and company_id=?', "Payment", item.id).count > 0)
        if item.partner
          html_string = html_string + build_nav("Company",item,"Link", "globe", PartnerLink.where('company_id=?', item.id).count > 0)
        end
        html_string = html_string + build_nav("Company",item,"Location","record", item.geo_address)
        html_string = html_string + build_nav("Company",item,"Email","envelope", Email.where('m_to=? or m_from=?', item.user.id, item.user.id).count > 0)
        
      when "Service"
        html_string = html_string + build_nav("Service",item,"Service","shopping-cart",item)
        html_string = html_string + build_nav("Service",item,"Servicedokument","book",item.service_documents.count > 0)
        html_string = html_string + build_nav("Service",item,"Servicekundenberater","user",item.advisors.count > 0)
        html_string = html_string + build_nav("Service",item,"Servicerating","star",item.ratings.count > 0)

      when "Vehicle"
        html_string = html_string + build_nav("Vehicle",item,"Vehicleinformation","retweet",item)
        html_string = html_string + build_nav("Vehicle",item,"Vehiclekalender","calendar",item.calenders.count > 0)
        html_string = html_string + build_nav("Vehicle",item,"Vehicleuser","user",item.calenders.count > 0)
        html_string = html_string + build_nav("Vehicle",item,"Vehiclestandort","record",item.geo_address)

      when "Bid"
        html_string = html_string + build_nav("Bid",item,"Bidinformation","pencil",item)
        html_string = html_string + build_nav("Bid",item,"Biddetail","search",item.bid_details.count > 0)
        html_string = html_string + build_nav("Bid",item,"Biddokument","book",item.bid_documents.count > 0)
        html_string = html_string + build_nav("Bid",item,"Bidangebot","book",item.bid_documents.count > 0)
        html_string = html_string + build_nav("Bid",item,"Bidstandort","record",item.geo_address)

      when "Job"
        html_string = html_string + build_nav("Job",item,"Jobinformation","briefcase",item)
        html_string = html_string + build_nav("Job",item,"Jobdetail","search",item)

      when "Event"
        html_string = html_string + build_nav("Event",item,"Eventinformation","glass",item)
        html_string = html_string + build_nav("Event",item,"Eventdetail","search",item.event_details.count > 0)
        html_string = html_string + build_nav("Event",item,"Eventsponsor","heart",item.sponsors.count > 0)
        html_string = html_string + build_nav("Event",item,"Eventstandort","record",item.geo_address)

      when "Hotspot"
        html_string = html_string + build_nav("Hotspot",item,"Hotspotinformation","camera",item)
        html_string = html_string + build_nav("Hotspot",item,"Hotspotdetail","search",item.hotspot_details.count > 0)
        html_string = html_string + build_nav("Hotspot",item,"Hotspotbewertung","star",item.hs_ratings.count > 0)
        html_string = html_string + build_nav("Hotspot",item,"Hotspotstandort","record",item.geo_address)

      when "Donation"
        html_string = html_string + build_nav("Donation",item,"Donationinformation","gift",item)
        html_string = html_string + build_nav("Donation",item,"Donationdetail","search",item.donation_details.count > 0)
        html_string = html_string + build_nav("Donation",item,"Donationstatistikanz","stats",item.donation_stats.count > 0)
        html_string = html_string + build_nav("Donation",item,"Donationstatistiksum","stats",item.donation_stats.count > 0)
        html_string = html_string + build_nav("Donation",item,"Donationstat","tree-deciduous",item.donation_stats.count > 0)

      when "Request"
        html_string = html_string + build_nav("Request",item,"Requestinformation","pushpin",item)
        html_string = html_string + build_nav("Request",item,"Requestdetail","search",item.request_details.count > 0)

    end
    
    #html_string = html_string + "</div></div></navigate>"
    html_string = html_string + "</navigate>"
    return html_string.html_safe
    
end

def build_nav(object, item, topic, glyphicon, condition)
  if condition
    btn = "active"
  else
    btn = "inactive"
  end
  
  case object
    when "User"
      html_string = link_to(user_path(item, :topic => topic)) do
        content_tag(:i, nil, class:"btn btn-"+btn+" glyphicon glyphicon-" + glyphicon)
      end
    when "Company"
      html_string = link_to(company_path(item, :topic => topic)) do
        content_tag(:i, nil, class:"btn btn-"+btn+" glyphicon glyphicon-" + glyphicon)
      end
    when "Service"
      html_string = link_to(service_path(item, :topic => topic)) do
        content_tag(:i, nil, class:"btn btn-"+btn+" glyphicon glyphicon-" + glyphicon)
      end
    when "Vehicle"
      html_string = link_to(vehicle_path(item, :topic => topic)) do
        content_tag(:i, nil, class:"btn btn-"+btn+" glyphicon glyphicon-" + glyphicon)
      end
    when "Bid"
      html_string = link_to(bid_path(item, :topic => topic)) do
        content_tag(:i, nil, class:"btn btn-"+btn+" glyphicon glyphicon-" + glyphicon)
      end
    when "Job"
      html_string = link_to(job_path(item, :topic => topic)) do
        content_tag(:i, nil, class:"btn btn-"+btn+" glyphicon glyphicon-" + glyphicon)
      end
    when "Event"
      html_string = link_to(event_path(item, :topic => topic)) do
        content_tag(:i, nil, class:"btn btn-"+btn+" glyphicon glyphicon-" + glyphicon)
      end
    when "Hotspot"
      html_string = link_to(hotspot_path(item, :topic => topic)) do
        content_tag(:i, nil, class:"btn btn-"+btn+" glyphicon glyphicon-" + glyphicon)
      end
    when "Donation"
      html_string = link_to(donation_path(item, :topic => topic)) do
        content_tag(:i, nil, class:"btn btn-"+btn+" glyphicon glyphicon-" + glyphicon)
      end
    when "Request"
      html_string = link_to(request_path(item, :topic => topic)) do
        content_tag(:i, nil, class:"btn btn-"+btn+" glyphicon glyphicon-" + glyphicon)
      end
  end
  return html_string.html_safe
end

def action_buttons(object, item, topic)
    
    html_string = "<div class='col-xs-12'><div class='panel-body'>"
    
    case object 
      when "User"
        html_string = html_string + link_to(users_path :page => session[:page]) do
          content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-list")
        end
        if user_signed_in?
          html_string = html_string + link_to(new_favourit_path :object_name => "User", :object_id => item.id, :user_id => current_user.id) do
            content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-star")
          end
          if current_user.id == item.id or current_user.superuser
              html_string = html_string + link_to(edit_user_path(item)) do
              content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-wrench")
            end
            html_string = html_string + link_to(item, method: :delete, data: { confirm: 'Are you sure?' }) do
                content_tag(:i, nil, class: "btn btn-danger pull-right glyphicon glyphicon-trash")
            end
          end
          html_string = html_string + link_to(new_webmaster_path :object_name => "User", :object_id => item.id, :user_id => current_user.id) do
            content_tag(:i, nil, class: "btn btn-warning pull-right glyphicon glyphicon-eye-open")
          end
          html_string = html_string + link_to(listaccounts_index_path :user_id => current_user.id, :user_id_ver => item.id, :company_id_ver => nil, :ref => "Vergütung an "+item.name + " " + item.lastname, :object_name => "User", :object_id => item.id, :amount => nil) do
            content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-euro")
          end
        end
      
      when "Company"
        html_string = html_string + link_to(companies_path :page => session[:page]) do
          content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-list")
        end
        if user_signed_in?
          html_string = html_string + link_to(new_favourit_path :object_name => "Company", :object_id => item.id, :user_id => current_user.id) do
            content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-star")
          end
          if current_user.id == item.user.id or current_user.superuser
            if item.partner
              html_string = html_string + link_to(customer_advisor_index2_path :partner_id => item.id) do
                content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-user")
              end
            end
            html_string = html_string + link_to(edit_company_path(item)) do
              content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-wrench")
            end
            html_string = html_string + link_to(item, method: :delete, data: { confirm: 'Are you sure?' }) do
              content_tag(:i, nil, class: "btn btn-danger pull-right glyphicon glyphicon-trash")
            end
          end
          html_string = html_string + link_to(new_webmaster_path :object_name => "Company", :object_id => item.id, :user_id => current_user.id) do
            content_tag(:i, nil, class: "btn btn-warning pull-right glyphicon glyphicon-eye-open")
          end
          html_string = html_string + link_to(listaccounts_index_path :user_id => current_user.id, :user_id_ver => nil, :company_id_ver => item.id, :ref => "Vergütung an "+item.name, :object_name => "Company", :object_id => item.id, :amount => nil) do
            content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-euro")
          end
        end

      when "Service"
          if item.stype == "action"
            html_string = html_string + link_to(offer_index_path :page => session[:page], :stype => "action") do
              content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-list")
            end
          else
            html_string = html_string + link_to(offer_index_path :page => session[:page], :stype => "regular") do
              content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-list")
            end
          end
          if user_signed_in?
            if (item.user_id and item.user_id == current_user.id) or (item.company_id and item.company.user.id == current_user.id)
      	        html_string = html_string + link_to(edit_service_path(item)) do
                  content_tag(:i, nil, class: "btn btn-primary glyphicon glyphicon-wrench")
                end
      	        html_string = html_string + link_to(item, method: :delete, data: { confirm: 'Are you sure?' }) do
                  content_tag(:i, nil, class: "btn btn-danger pull-right glyphicon glyphicon-trash")
                end
                if item.price_new
                  price = item.price_new
                else
                  price = item.price_reg
                end
                html_string = html_string + link_to(listaccounts_index_path :user_id => current_user.id, :user_id_ver => item.user_id, :company_id_ver => item.company_id, :ref => "Vergütung an "+ item.name, :object_name => "Service", :object_id => item.id, :amount => price) do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-euro")
                end
      	        html_string = html_string + link_to(new_webmaster_path :object_name => "Service", :object_id => item.id, :user_id => current_user.id) do
                  content_tag(:i, nil, class:"btn btn-warning pull-right glyphicon glyphicon-eye-open")
                end
            end
  	        html_string = html_string + link_to(new_rating_path :service_id => item.id, :user_id => current_user.id) do
              content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
            end
          end

          case topic
            when "Servicedokument"
              if user_signed_in?
                if (item.user_id and current_user.id == item.user_id) or (item.company_id and current_user.id == item.company.user.id)
                    html_string = html_string + link_to(new_service_document_path :service_id => item.id) do
                      content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                    end
                end
              end
              
            when "Servicekundenberater"
              if user_signed_in?
                if (item.user_id and current_user.id == item.user_id) or (item.company_id and current_user.id == item.company.user_id)
                  html_string = html_string + link_to(advisors_path :service_id => item.id) do
                    content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                  end
                end
              end

            when "Servicerating"
              if user_signed_in?
                if (item.user_id and current_user.id == item.user_id) or (item.company_id and current_user.id == item.company.user_id)
                  html_string = html_string + link_to(new_rating_path :service_id => item.id) do
                    content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                  end
                end
              end
          end

      when "Vehicle"
         html_string = html_string + link_to(vehicles_path :page => session[:page]) do
           content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-list")
         end
         if user_signed_in?
           if (item.user_id and current_user.id == item.user.id) or (item.company_id and current_user.id == item.company.user.id) 
     	        html_string = html_string + link_to(edit_vehicle_path(item)) do
                 content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-wrench")
               end
     	        html_string = html_string + link_to(item, method: :delete, data: { confirm: 'Are you sure?' }) do
                 content_tag(:i, nil, class:"btn btn-danger pull-right glyphicon glyphicon-trash")
               end
           end
           html_string = html_string + link_to(listaccounts_index_path :user_id => current_user.id, :user_id_ver => item.user_id, :company_id_ver => item.company_id, :ref => "Vergütung an "+ item.name, :object_name => "Vehicle", :object_id => item.id, :amount => 0) do
             content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-euro")
           end
           html_string = html_string + link_to(new_webmaster_path :object_name => "Vehicle", :object_id => item.id, :user_id => current_user.id) do
             content_tag(:i, nil, class:"btn btn-warning pull-right glyphicon glyphicon-eye-open")
           end
         end
         
         case topic
            when "Vehiclekalender", "Vehicleuser"
              if user_signed_in?
                html_string = html_string + link_to(new_calender_path(:user_id => current_user.id, :vehicle_id => item.id)) do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                end
              end
              html_string = html_string + link_to(vehicle_path(:vehicle_id => item.id, :dir => "<", :topic => topic)) do
                content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-chevron-left")
              end
              html_string = html_string + link_to(vehicle_path(:vehicle_id => item.id, :dir => ">", :topic => topic)) do
                content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-chevron-right")
              end
         end
         
      when "Bid"
         html_string = html_string + link_to(bids_path :page => session[:page]) do
           content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-list")
         end
         if user_signed_in?
           if (item.user_id and current_user.id == item.user.id)
     	        html_string = html_string + link_to(edit_bid_path(item)) do
                 content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-wrench")
               end
     	        html_string = html_string + link_to(item, method: :delete, data: { confirm: 'Are you sure?' }) do
                 content_tag(:i, nil, class:"btn btn-danger pull-right glyphicon glyphicon-trash")
               end
           end
           html_string = html_string + link_to(new_webmaster_path :object_name => "Bid", :object_id => item.id, :user_id => current_user.id) do
             content_tag(:i, nil, class:"btn btn-warning pull-right glyphicon glyphicon-eye-open")
           end
         end
         
         case topic
            when "Biddetail"
              if user_signed_in?
                html_string = html_string + link_to(new_bid_detail_path(:bid_id => item.id)) do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                end
              end
            when "Biddokument"
              if user_signed_in?
                html_string = html_string + link_to(new_bid_document_path(:bid_id => item.id)) do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                end
              end
            when "Bidangebot"
              if user_signed_in?
                html_string = html_string + link_to(new_bid_document_path(:bid_id => item.id, :mode => "company")) do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                end
              end
         end
         
      when "Job"
         html_string = html_string + link_to(jobs_path :page => session[:page]) do
           content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-list")
         end
         if user_signed_in?
           if current_user.id == item.company.user.id
     	        html_string = html_string + link_to(edit_job_path(item)) do
                 content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-wrench")
               end
     	        html_string = html_string + link_to(item, method: :delete, data: { confirm: 'Are you sure?' }) do
                 content_tag(:i, nil, class:"btn btn-danger pull-right glyphicon glyphicon-trash")
               end
           end
           html_string = html_string + link_to(new_webmaster_path :object_name => "Job", :object_id => item.id, :user_id => current_user.id) do
             content_tag(:i, nil, class:"btn btn-warning pull-right glyphicon glyphicon-eye-open")
           end
         end

      when "Event"
         html_string = html_string + link_to(events_path :page => session[:page]) do
           content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-list")
         end
         if user_signed_in?
           if (item.user_id and current_user.id == item.user.id) or (item.company_id and current_user.id == item.company.user.id) 
     	        html_string = html_string + link_to(edit_event_path(item)) do
                 content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-wrench")
               end
     	        html_string = html_string + link_to(item, method: :delete, data: { confirm: 'Are you sure?' }) do
                 content_tag(:i, nil, class:"btn btn-danger pull-right glyphicon glyphicon-trash")
               end
           end
           html_string = html_string + link_to(new_webmaster_path :object_name => "Event", :object_id => item.id, :user_id => current_user.id) do
             content_tag(:i, nil, class:"btn btn-warning pull-right glyphicon glyphicon-eye-open")
           end
         end
         
         case topic
            when "Eventdetail"
              if user_signed_in?
                html_string = html_string + link_to(new_event_detail_path(:event_id => item.id)) do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                end
              end
            when "Eventsponsor"
              if user_signed_in?
                html_string = html_string + link_to(new_sponsor_path(:event_id => item.id)) do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                end
              end
         end
         
      when "Hotspot"
         html_string = html_string + link_to(hotspots_path :page => session[:page]) do
           content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-list")
         end
         if user_signed_in?
           if item.user_id and current_user.id == item.user.id
     	        html_string = html_string + link_to(edit_hotspot_path(item)) do
                 content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-wrench")
               end
     	        html_string = html_string + link_to(item, method: :delete, data: { confirm: 'Are you sure?' }) do
                 content_tag(:i, nil, class:"btn btn-danger pull-right glyphicon glyphicon-trash")
               end
           end
           html_string = html_string + link_to(new_webmaster_path :object_name => "Hotspot", :object_id => item.id, :user_id => current_user.id) do
             content_tag(:i, nil, class:"btn btn-warning pull-right glyphicon glyphicon-eye-open")
           end
         end
         
         case topic
            when "Hotspotdetail"
              if user_signed_in?
                html_string = html_string + link_to(new_hotspot_detail_path(:hotspot_id => item.id)) do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                end
              end
            when "Hotspotbewertung"
              if user_signed_in?
                html_string = html_string + link_to(new_hs_rating_path(:hotspot_id => item.id, :user_id => current_user.id)) do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                end
              end
         end

      when "Donation"
         html_string = html_string + link_to(donations_path :dtype => item.dtype) do
           content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-list")
         end
         if user_signed_in?
           if (item.user_id and current_user.id == item.user.id) or (item.company_id and current_user.id == item.company.user.id) 
     	        html_string = html_string + link_to(edit_donation_path(item)) do
                 content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-wrench")
               end
     	        html_string = html_string + link_to(item, method: :delete, data: { confirm: 'Are you sure?' }) do
                 content_tag(:i, nil, class:"btn btn-danger pull-right glyphicon glyphicon-trash")
               end
           end
           html_string = html_string + link_to(new_webmaster_path :object_name => "Donation", :object_id => item.id, :user_id => current_user.id) do
             content_tag(:i, nil, class:"btn btn-warning pull-right glyphicon glyphicon-eye-open")
           end
         end
         
         case topic
            when "Donationdetail"
              if user_signed_in?
                html_string = html_string + link_to(new_donation_detail_path(:donation_id => item.id)) do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                end
              end
            when "Donationstat"
              if item.donation_stats.sum(:amount) < item.amount
                html_string = html_string + link_to(new_donation_stat_path(:donation_id => item.id, :dontype => "User")) do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-user")
                end
                html_string = html_string + link_to(new_donation_stat_path(:donation_id => item.id, :dontype => "Company")) do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-copyright-mark")
                end
            else
              if (@donation.company_id and current_user.id == @donation.company.user_id) or (@donation.user_id and current_user.id == @donation.user_id) and @donation.dtype == "Reward"
                html_string = html_string + link_to(donation_path(:dtype => topic, :donation_trx_id => item.id)) do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-euro")
                end
              end
            end
         end
  
        when "Request"
         html_string = html_string + link_to(requests_path :rtype => item.rtype, :page => session[:page]) do
           content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-list")
         end
         if user_signed_in?
           if item.user_id and current_user.id == item.user.id 
     	        html_string = html_string + link_to(edit_request_path(item)) do
                 content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-wrench")
               end
     	        html_string = html_string + link_to(item, method: :delete, data: { confirm: 'Are you sure?' }) do
                 content_tag(:i, nil, class:"btn btn-danger pull-right glyphicon glyphicon-trash")
               end
           end
           html_string = html_string + link_to(new_webmaster_path :object_name => "request", :object_id => item.id, :user_id => current_user.id) do
             content_tag(:i, nil, class:"btn btn-warning pull-right glyphicon glyphicon-eye-open")
           end
         end
         
         case topic
            when "Requestdetail"
              if user_signed_in?
                html_string = html_string + link_to(new_request_detail_path(:request_id => item.id)) do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                end
              end
         end

        when "Account"
           html_string = html_string + link_to(item) do
             content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-list")
           end
           
    end

    case topic
        when "Service"
          if user_signed_in?
            if object == "User"
              if current_user.id == item.id
                html_string = html_string + link_to(new_service_path :user_id => item.id, :stype => "regular") do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                end
              end
            end
            if object == "Company"
              if current_user.id == item.user.id
                html_string = html_string + link_to(new_service_path :company_id => item.id, :stype => "regular") do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                end
              end
            end
          end


        when "Aktion"
          if user_signed_in?
            if object == "Company"
              if current_user.id == item.user.id
                html_string = html_string + link_to(new_service_path :company_id => item.id, :stype => "action") do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                end
              end
            end
          end
          
        when "Company"
          if object == "User" and user_signed_in?
            if current_user.id == item.id
              html_string = html_string + link_to(new_company_path :user_id => item.id) do
                content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
              end
            end
          end

        when "Request"
          if object == "User" and user_signed_in?
            if current_user.id == item.id
              html_string = html_string + link_to(new_request_path :user_id => item.id) do
                content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
              end
            end
          end

        when "Vehicle"
          if user_signed_in?
            if object == "User"
              if current_user.id == item.id
                html_string = html_string + link_to(new_vehicle_path :user_id => item.id) do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                end
              end
            end
            if object == "Company"
              if current_user.id == item.user.id
                html_string = html_string + link_to(new_vehicle_path :company_id => item.id) do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                end
              end
            end
          end

        when "Event"
          if user_signed_in?
            if object == "User"
              if current_user.id == item.id
                html_string = html_string + link_to(new_event_path :user_id => item.id) do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                end
              end
            end
            if object == "Company"
              if current_user.id == item.user.id
                html_string = html_string + link_to(new_event_path :company_id => item.id) do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                end
              end
            end
          end

        when "Ticket"
          if object == "User" and user_signed_in?
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
                content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
              end
            end
          end

        when "Hotspot"
          if object == "User" and user_signed_in?
            if current_user.id == item.id
              html_string = html_string + link_to(new_hotspot_path :user_id => item.id) do
                content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
              end
            end
          end

        when "Bid"
          if object == "User" and user_signed_in?
            if current_user.id == item.id
              html_string = html_string + link_to(new_bid_path :user_id => item.id) do
                content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
              end
            end
          end

        when "Donation"
          if user_signed_in?
            if object == "Company"
              if current_user.id == item.user.id and item.social
                html_string = html_string + link_to(new_donation_path :company_id => item.id, :dtype => "Donation") do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                end
              end
            end
          end

        when "Link"
          if user_signed_in?
            if object == "Company"
              if current_user.id == item.user_id and item.partner
                html_string = html_string + link_to(new_partner_link_path :company_id => item.id) do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                end
              end
            end
          end

        when "Job"
          if user_signed_in?
            if object == "Company"
              if current_user.id == item.user.id
                html_string = html_string + link_to(new_job_path :company_id => item.id) do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                end
              end
            end
          end

        when "Reward"
          if user_signed_in?
            if object == "User"
              if current_user.id == item.id
                html_string = html_string + link_to(new_donation_path :user_id => item.id, :dtype => "Reward") do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                end
              end
            end
            if object == "Company"
              if current_user.id == item.user.id
                html_string = html_string + link_to(new_donation_path :company_id => item.id, :dtype => "Reward") do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                end
              end
            end
          end

        when "Loan"
          if user_signed_in?
            if object == "User"
              if current_user.id == item.id
                html_string = html_string + link_to(new_donation_path :user_id => item.id, :dtype => "Loan") do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                end
              end
            end
            if object == "Company"
              if current_user.id == item.user.id
                html_string = html_string + link_to(new_donation_path :company_id => item.id, :dtype => "Loan") do
                  content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
                end
              end
            end
          end
          
        when "Userkalender"
          if user_signed_in?
              html_string = html_string + link_to(new_appointment_path(:user_id1 => item.id, :user_id2 => current_user.id)) do
                content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-plus")
              end
          end
          html_string = html_string + link_to(user_path(:id => item.id, :dir => "<", :topic => topic)) do
            content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-chevron-left")
          end
          html_string = html_string + link_to(user_path(:id => item.id, :dir => ">", :topic => topic)) do
            content_tag(:i, nil, class:"btn btn-primary glyphicon glyphicon-chevron-right")
          end

    end
    html_string = html_string + "</div></div>"
    return html_string.html_safe
end

def build_stats(array, records, label)
  if records != nil
    anz = records.count
    if anz > 0
      hash = Hash.new
      hash = {"label" => label, "value" => anz}
      array << hash
      return array
    end
  end
  return array
end

def build_kachel(object, path, glyphicon, logon)
  if logon and !user_signed_in?
    return
  else
    html_string = ""
    icon_size = "3"
    
    case object 
    when "Angebote"
      path = services_path(:stype => "regular")
    when "Aktionen"
      if glyphicon == "time"
        path = services_path(:stype => "action")
      end
    when "Suchen"
      path = requests_path(:rtype => "suche")
    when "Anbieten"
      path = requests_path(:rtype => "biete")
    when "Spenden"
      path = donations_path(:dtype => "Donation")
    when "Belohnung"
      path = donations_path(:dtype => "Reward")
    when "Kredit"
      path = donations_path(:dtype => "Loan")
    end
    
    html_string = html_string + link_to(path) do
      content_tag(:div, nil, class:"col-xs-4 col-sm-3 col-md-2 col-lg-1") do 
        content_tag(:div, nil, class:"thumbnail", align:"center") do
          content_tag(:span, nil) do
            content_tag(:i, nil, class:"glyphicon glyphicon-" + glyphicon, style:"font-size:" + icon_size + "em") + content_tag(:small_cal, "<br>".html_safe+object)
          end
        end
      end
    end

    return html_string.html_safe
    
  end
end

def build_kachel_color(object, path, glyphicon, logon)
  if logon and !user_signed_in?
    return
  else
    html_string = ""
    icon_size = "3"
    
    case object 
    when "Angebote"
      path = services_path(:stype => "regular")
    when "Aktionen"
      if glyphicon == "time"
        path = services_path(:stype => "action")
      end
    when "Suchen"
      path = requests_path(:rtype => "suche")
    when "Anbieten"
      path = requests_path(:rtype => "biete")
    when "Spenden"
      path = donations_path(:dtype => "Donation")
    when "Belohnung"
      path = donations_path(:dtype => "Reward")
    when "Kredit"
      path = donations_path(:dtype => "Loan")
    end
    
    html_string = html_string + link_to(path) do
      content_tag(:div, nil, class:"col-xs-4 col-sm-3 col-md-2 col-lg-1") do 
        content_tag(:div, nil, class:"thumbnail", align:"center") do
          content_tag(:span, nil) do
            #content_tag(:i, nil, class:"glyphicon glyphicon-" + glyphicon, style:"font-size:" + icon_size + "em") + content_tag(:small_cal, "<br>".html_safe+object)
            image_tag(glyphicon+".png", :size => "45x45") + content_tag(:small_cal, "<br>".html_safe+object)
          end
        end
      end
    end

    return html_string.html_safe
    
  end
end


end    