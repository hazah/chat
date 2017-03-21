class UserTyping extends Spine.Controller
  el: "#user_typing"

  constructor: (chat) ->
    super
    @typing_users = []
    User.bind "refresh", @setup
    @render()

  setup: =>
    User.each(@setupUser)

  setupUser: (user) =>
    user.bind "typing", @typing
    user.bind "not_typing", @not_typing

  typing: (user) =>
    @typing_users.push user if user.id not in @typing_users.map((u) -> u.id)
    @render()

  not_typing: (user) =>
    @typing_users = @typing_users.filter (u) -> not u.id is user.id
    @render()

  render: =>
    @html(@template(@))

  template: (data) ->
    @view('typing')(data)

window.UserTyping = UserTyping