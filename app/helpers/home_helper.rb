module HomeHelper

def dash
    $str = ""
    html = ""

    html = html + "<div class:'gridster' />"
        html = html + "<ul> /"
            html = html + "<li data-row='1' data-col='1' data-sizex='2' data-sizey='1' />"
                html = html + "<div data-id='welcome1' data-view='Text' data-title='Hello' data-text='hi- I am new here' data-moreinfo='Protip You can drag the widgets around' />"
                html = html + "</div> /"
        html = html + "</ul> /"
    html = html + "</div> /"

    # workorders = Workorder.all
    # workorders.each do |wo| 

    #     html << '<li data-row="2" data-col="1" data-sizex="1" data-sizey="1">' 
    #     html << '<div data-id="company" data-view="Meter" data-title="companies" data-min="0" data-max="100"></div>'.html_safe
    #     html << '</li>'
        
    # end


    $str = html
    return html.html_safe
end

end


# <div class="gridster">
#   <ul>
#     <li data-row="1" data-col="1" data-sizex="2" data-sizey="1">
#       <div data-id="welcome" data-view="Text" data-title="Hello" data-text="This is your shiny new dashboard." data-moreinfo="Protip: You can drag the widgets around!"></div>
#     </li>
#     <li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
#       <div data-id="company" data-view="Meter" data-title="#companies" data-min="0" data-max="100"></div>
#     </li>
#     <li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
#       <div data-id="user" data-view="Meter" data-title="#users" data-min="0" data-max="100"></div>
#     </li>
#     <li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
#       <div data-id="workorder" data-view="Meter" data-title="#workorders" data-min="0" data-max="100"></div>
#     </li>
#     <li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
#       <div data-id="timetrack" data-view="Meter" data-title="#time reports" data-min="0" data-max="100"></div>
#     </li>
#     <li data-row="1" data-col="1" data-sizex="1" data-sizey="2">
#       <div data-id="buzzwords" data-view="List" data-unordered="true" data-title="Buzzwords" data-moreinfo="# of times said around the office"></div>
#     </li>
#     <li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
#       <div data-id="valuation" data-view="Number" data-title="Current Valuation" data-moreinfo="In billions" data-prefix="$"></div>
#     </li>
#     <li data-row="1" data-col="1" data-sizex="2" data-sizey="1">
#       <div data-id="convergence" data-view="Graph" data-title="Convergence" style="background-color:#ff9618"></div>
#     </li>
#   </ul>
#   <center><div style="font-size: 12px">Try this: curl -X PUT 'http://<%= request.host %>:<%= request.port %>/dashing/widgets/welcome' -d "widget[text]=Dashing is awesome"</div></center>
# </div>
