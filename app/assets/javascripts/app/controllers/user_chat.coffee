class UserChat extends Spine.Controller
  el: "#chat_#{gon.chat_id}"

  constructor: ->
    super
    Chat.bind "refresh", @loadUsers

    @user_typing = new UserTyping
    @prepend(@messages = new Messages)

    Chat.fetch(data: $.param({ where: { id: gon.chat_id } }))

  loadUsers: =>
    @chat = Chat.find(gon.chat_id)
    User.fetch(data: $.param({ where: { id: @chat.user_ids } }))

window.UserChat = UserChat