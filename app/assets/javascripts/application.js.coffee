#= require jquery.min
#= require bootstrap
#= require bootstrap-datetimepicker
#= require_tree .


window.onload = ->
  action = $('.reload_action')
  if action.val() == 'true'
    location.reload()

ping = ->
  request = $.get '/'
  request.success (data) -> $('body').append "Successfully got the page again."
  request.error (jqXHR, textStatus, errorThrown) -> $('body').append "AJAX Error: ${textStatus}."
#  location.reload()

#setInterval(ping, 1000)