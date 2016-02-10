# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    $('#starting_date').datepicker dateFormat: 'yy-mm-dd'
    $('#ending_date').datepicker dateFormat: 'yy-mm-dd'
    $('#reporting_date').datepicker dateFormat: 'yy-mm-dd' 
    $('#datum').datepicker dateFormat: 'yy-mm-dd' 
    
    Morris.Line
        element: 'timetracks_chart' 
        data: $('#timetracks_chart').data('timetracks')
        xkey: 'datum' 
        ykeys: ['amount'] 
        labels: ['hours reported']

