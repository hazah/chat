class MessagesController < ApplicationController
  respond_to :json
  expose :chat
  expose :messages, -> { chat.messages }

  def index
    respond_with messages
  end
end
