#= require jquery.min
#= require bootstrap
#= require bootstrap-datetimepicker
#= require_tree .


window.onload = ->
  action = $('.reload_action')
  if action.val() == 'true'
    location.reload()

  $('#delete_form').submit =>
    confirm("Вы уверены?")

  $('#question_form').submit =>
    valid = true
    $('#question_form input.required').each (index, element) ->
      if element.value==''
        alert("Все поля обязательные! Не заполнено поле " + $("[for='"+element.id+"']").text())
        valid = false
        return false
    valid

ping = ->
  request = $.get '/'
  request.success (data) -> $('body').append "Successfully got the page again."
  request.error (jqXHR, textStatus, errorThrown) -> $('body').append "AJAX Error: ${textStatus}."
#  location.reload()

#setInterval(ping, 1000)