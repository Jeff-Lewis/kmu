# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    $('#donation_date_from').datepicker {
        dateFormat: 'yy-mm-dd',
        firstDay: 1
    }
    $('#donation_date_to').datepicker {
        dateFormat: 'yy-mm-dd',
        firstDay: 1
    }    
    $('#donation_due_date').datepicker {
        dateFormat: 'yy-mm-dd',
        firstDay: 1
    }

jQuery ->    
    Morris.Line
        element: 'reports_chart' 
        data: $('#reports_chart').data('reports')
        xkey: 'datum' 
        ykeys: ['summe'] 
        labels: ['$ spent']

jQuery ->
 $('.dropdown-toggle').dropdown()
