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

    Morris.Line
      element: 'lines'
      data: [{ y: '2006', a: 100, b: 90 },{ y: '2007', a: 75,  b: 65 },{ y: '2008', a: 50,  b: 40 },{ y: '2009', a: 75,  b: 65 }]
      xkey: 'y'
      ykeys: ['a', 'b']
      labels: ['Series A', 'Series B']