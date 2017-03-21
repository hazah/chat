# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'keypress submit', '[data-behavior~=speaker], #new_message', (event) ->
  if event.keyCode is 13 # return = send
    Channels.chat.speak event.target.value
    event.target.value = ""
    Channels.chat.not_typing()
    event.preventDefault()

$(document).on 'keyup', '[data-behavior~=speaker]', (event) ->
  if event.target.value.length is 0 and event.keyCode is 8
    Channels.chat.not_typing()
  else if !(event.keyCode is 13)
    Channels.chat.typing()