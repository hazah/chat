$(document).on 'turbolinks:load', ->
  class Message extends Spine.Model
    @configure 'Message', "content", "chat_id", "created_at"

    @extend Spine.Model.Ajax
    
  window.Message = Message