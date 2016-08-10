# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    $('#appointment_date_from').datepicker dateFormat: 'yy-mm-dd'    
    $('#appointment_date_to').datepicker dateFormat: 'yy-mm-dd'
