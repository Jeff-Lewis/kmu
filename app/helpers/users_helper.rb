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

def build_medialist(col, items, cname)
    md_string = (12/col).to_i.to_s
    html_string = '<div class="panel-body">'
    
        first=true
        colcounter=col
        items.each do |item|
            if colcounter == col
              colcounter = 0
              if first
                  first = false
              else
                html_string = html_string + "</div><br><br>"
              end
              html_string = html_string + '<div class="row">'
            end
            html_string = html_string + "<div class='col-md-"+md_string+"'>"
                html_string = html_string + "<div class='media'>"
                    html_string = html_string + "<div class='media-left'>"
                        case cname
                        when "actions"
                            html_string = html_string + "<a href=/services/"+item.id.to_s+">"
                        else 
                            html_string = html_string + "<a href=/"+cname+"/"+item.id.to_s+">"
                        end
                        if cname == "hotspots"
                            html_string = html_string + carousel(item.hotspot_details,"small")
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
                      case cname
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
                      when "actions"
                          if item.social
                                html_string = html_string + "<i class='glyphicon glyphicon-heart'></i>"+ " "
                          end
                          avg_rating(item.id).times do
                            html_string = html_string + "<i class='glyphicon glyphicon-star'></i>" + " "
                          end
                          html_string = html_string + '<h4 class="media-heading">'+ item.name + " "
                          html_string = html_string + "</h4>"
                          if item.company_id != nil
                              html_string = html_string + item.company.name
                          end
                          if item.user_id != nil
                              html_string = html_string + item.user.name + " "+ item.user.lastname
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
                html_string = html_string + "</div>"
            html_string = html_string + "</div>"
            colcounter = colcounter + 1
        end
        html_string = html_string + "</div>"
    html_string = html_string + "</div>"
    html_string.html_safe
end

end    