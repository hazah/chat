$(document).on 'turbolinks:load', ->
  class User extends Spine.Model
    @configure 'User', "email"

    @extend Spine.Model.Ajax


  window.User = User