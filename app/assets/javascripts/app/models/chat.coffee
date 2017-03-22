$(document).on 'turbolinks:load', ->
  class Chat extends Spine.Model
    @configure 'Chat', "name", "user_ids"
    
    @extend Spine.Model.Ajax

  window.Chat = Chat