# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    $('#service_date_from').datepicker dateFormat: 'yy-mm-dd'
    $('#service_dater_to').datepicker dateFormat: 'yy-mm-dd'