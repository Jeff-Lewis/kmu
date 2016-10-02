module HomeHelper

def carousel(scope, size)

    html = ""
    
    if scope.count == 0
      case size
          when "big"
            html = html + (image_tag "no_pic.jpg", :size => "500x500", class:"img-rounded")
        when "medium"
            html = html + (image_tag "no_pic.jpg", :size => "250x250", class:"img-rounded")
        when "thumb"
            html = html + (image_tag "no_pic.jpg", :size => "100x100", class:"img-rounded")
        when "small"
            html = html + (image_tag "no_pic.jpg", :size => "50x50", class:"img-rounded")
      end
      
    else

        html = html +  "<div id='carousel-example-generic' class='carousel slide' data-ride='carousel'>"
        
            html = html + "<ol class='carousel-indicators'>"
              scope.each do |p|
              	if p.avatar_file_name != nil
                    html = html + "<li data-target='#carousel-example-generic' data-slide-to='" + p.id.to_s + "' class='active'>"
                end
              end
            html = html + "</ol>"
            
            html = html + "<div class='carousel-inner' role='listbox'>"
                first = true
                scope.each do |p|
                  if first
                     html = html + "<div class='item active'>"
                     first = false
                  else
                     html = html + "<div class='item'>"
                  end
          	      if p.avatar_file_name != nil
          	        case size
          	            when "big"
                            html = html + (image_tag p.avatar(:big), class:"img-rounded")
                        when "medium"
                            html = html + (image_tag p.avatar(:medium), class:"img-rounded")
                        when "thumb"
                            html = html + (image_tag p.avatar(:thumb), class:"img-rounded")
                        when "small"
                            html = html + (image_tag p.avatar(:small), class:"img-rounded")
                    end
                  end
                  html = html + "</div>"
                end
                html = html + "</div>"
            html = html + "</div>"
        end
                
    return html.html_safe
end

def build_thumbnail(topic, pics)

    @pics = pics.all
    html = ""
    topic.each do |t|
        html = html + "<div class='col-md-4'>"
            html = html + "<div class='thumbnail' align='center'>"
            
                html = html + "<h1>" + t.name + "</h1>"
                html = html +  "<div id='carousel-example-generic" + t.id.to_s + "' class='carousel slide' data-ride='carousel'>"
                
                    html = html + "<ol class='carousel-indicators'>"
                      @pics.each do |p|
                        html = html + "<li data-target='#carousel-example-generic" + t.id.to_s + "' data-slide-to='" + p.id.to_s + "' class='active'>"
                      end
                    html = html + "</ol>"
                    
                    html = html + "<div class='carousel-inner' role='listbox'>"
                        first = true
                        @pics.each do |p|
                          if first
                             html = html + "<div class='item active'>"
                             first = false
                          else
                             html = html + "<div class='item'>"
                          end
                      	      if p.avatar_file_name == nil
                                html = html + image_tag("user_a.png", class:"img-responsive img-rounded")
                              else
                                html = html + (image_tag p.avatar(:medium), class:"img-rounded")
                              end
                              html = html + "<div class='carousel-caption'>"
                                    html = html + "<h1>" + p.name + "</h1>"
                              html = html + "</div>"
    
                          html = html + "</div>"
                        end
                    html = html + "</div>"
    
                html = html + "</div>"
                
            html = html + "</div>"
        html = html + "</div>"
    end
    puts html
    return html.html_safe
end

end