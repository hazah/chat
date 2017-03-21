class BroadcastUserTypingJob < ApplicationJob
  queue_as :default

  def perform(chat_id, user_id, typing)
    chat = Chat.find_by(id: chat_id)
    return unless chat

    ActionCable.server.broadcast "chat_#{chat.id}", { user_id: user_id, typing: typing }
  end
end
