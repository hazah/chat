$(document).on 'turbolinks:load', ->
  if gon.chat_id
    Channels.chat = Channels.cable.subscriptions.create { channel: "ChatChannel", chat_id: gon.chat_id },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        if data.typing?
          user = User.find(data.user_id)
          event = ""
          if data.typing is true
            event = "typing"
          else
            event = "not_typing"

          user.trigger(event, user)
        else
          Message.trigger "recieved", Message.fromJSON(data)

      speak: (message) ->
        @perform 'speak', message: message

      typing: ->
        @perform 'typing'

      not_typing: ->
        @perform 'not_typing'
