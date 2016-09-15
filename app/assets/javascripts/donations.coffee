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

    Morris.Line
        element: 'reports_chart_bet' 
        data: $('#reports_chart_bet').data('reports')
        xkey: 'datum' 
        ykeys: ['summe'] 
        labels: ['$ spent']

    Morris.Line
        element: 'reports_chart_anz' 
        data: $('#reports_chart_anz').data('reports')
        xkey: 'datum' 
        ykeys: ['summe'] 
        labels: ['Anzahl']

    $('.dropdown-toggle').dropdown()
