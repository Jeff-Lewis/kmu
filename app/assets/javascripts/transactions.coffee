# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    $('#transaction_trx_date').datepicker {
        dateFormat: 'yy-mm-dd',
        firstDay: 1
    }
    $('#transaction_valuta').datepicker {
        dateFormat: 'yy-mm-dd',
        firstDay: 1
    }