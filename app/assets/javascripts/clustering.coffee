$(document).on 'turbolinks:load', ->
  $('#select-cluste-form').change ->
    $('#cluste_form').submit()