$(document).on 'turbolinks:load', ->
  class Messages extends Spine.Controller
    attributes: { style: "height: 350px; overflow-y: scroll" }
    
    constructor: ->
      super
      Message.bind "refresh", @addAll
      Message.bind "recieved", @addOne
      
      Message.fetch { data: $.param({ chat_id: gon.chat_id }) } if gon.chat_id
      
    addAll: =>
      Message.each(@addOne)
      
    addOne: (message) =>
      item = new MessageItem(message: message)
      @append(item.render())
      @el.scrollTop @el[0].scrollHeight


  window.Messages = Messages