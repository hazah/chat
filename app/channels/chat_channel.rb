class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:chat_id]}"
  end

  def unsubscribed
    BroadcastUserTypingJob.perform_later params[:chat_id], current_user.id, false
  end

  def speak(data)
    chat = Chat.find_by(id: params[:chat_id])
    return unless chat

    chat.messages.create! user: current_user, content: data['message']
  end

  def typing
    BroadcastUserTypingJob.perform_later params[:chat_id], current_user.id, true
  end

  def not_typing
    BroadcastUserTypingJob.perform_later params[:chat_id], current_user.id, false
  end
end
