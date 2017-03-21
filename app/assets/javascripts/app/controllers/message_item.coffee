class MessageItem extends Spine.Controller
  constructor: ->
    super

  render: =>
    @html(@template(@message))

  template: (messages) ->
    @view('messages')(messages)

window.MessageItem = MessageItem