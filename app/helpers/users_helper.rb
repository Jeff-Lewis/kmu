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
                            when "hotspots"
                                html_string = html_string + carousel(item.hotspot_details,"small")
                            when "bids"
                                html_string = html_string + carousel(item.bid_details,"small")
                            when "events"
                                html_string = html_string + carousel(item.event_details,"small")
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
                      case items.table_name
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
                          if user_signed_in?
                              if cname == "partners"
                                  html_string = html_string + "<br>"
                                  @customer = Customer.where("user_id=? AND company_id=?", current_user.id, item.id).first
                                  if !@customer
                                      html_string = html_string + "<a href=/customers/new?user_id=" + current_user.id.to_s + "&company_id=" + item.id.to_s + ">"
                                      html_string = html_string + "<i class='btn btn-primary btn-lg glyphicon glyphicon-pencil'></i></a>"
                                  else
                                      html_string = html_string + "<a href=/customers/" + @customer.id.to_s + "/edit>"
                                      html_string = html_string + "<i class='btn btn-primary btn-lg glyphicon glyphicon-wrench'></i></a>"
                                      
                                      html_string = html_string + "<a data-confirm='Wollen Sie die Kundenbeziehung wirklich löschen?' rel='nofollow' data-method='delete' href=/customers/" + @customer.id.to_s + ">"
                                      html_string = html_string + "<i class='btn btn-danger btn-lg glyphicon glyphicon-trash'></i></a>"
                                  end
                              end 
                          end
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
                          if item.date_to != nil
                            html_string = html_string + "<ntext>noch </ntext><restlaufzeits>" + (item.date_to.to_date - DateTime.now.to_date).to_i.to_s + "</restlaufzeits><ntext> Tage</ntext><br>"
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
                      when "hotspots"
                          HsRating.avg_rating(item).to_i.times do
                            html_string = html_string + "<i class='glyphicon glyphicon-star'></i>" + " "
                          end
                          html_string = html_string + '<h4 class="media-heading">'+ item.name + " "
                          html_string = html_string + "</h4>"
                          html_string = html_string + item.user.name + " "+ item.user.lastname
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