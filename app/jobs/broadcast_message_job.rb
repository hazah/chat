class BroadcastMessageJob < ApplicationJob
  queue_as :default

  def perform(message_id)
    message = Message.find_by(id: message_id)
    return unless message

    ActionCable.server.broadcast "chat_#{message.chat_id}", render(message)
  end

  private

    def render(message)
      ApplicationController.renderer.render json: message
    end
end
