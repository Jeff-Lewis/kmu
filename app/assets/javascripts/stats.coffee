# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    $('#starting_date').datepicker dateFormat: 'yy-mm-dd'
    $('#ending_date').datepicker dateFormat: 'yy-mm-dd'
      
    Morris.Bar
        element: 'reports_chart' 
        data: $('#reports_chart').data('reports')
        xkey: 'datum' 
        ykeys: ['amount'] 
        labels: ['hours reported']