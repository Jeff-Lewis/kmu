# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    $('#service_datum_von').datepicker dateFormat: 'yy-mm-dd'
    $('#service_datum_bis').datepicker dateFormat: 'yy-mm-dd'