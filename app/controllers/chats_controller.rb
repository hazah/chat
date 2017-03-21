class ChatsController < ApplicationController
  expose :chat
  respond_to :html, :json
  before_action ->() { gon.chat_id = chat.id }, if: :chat

  def index
    @chats = Chat.all
    respond_with(@chats)
  end

  def show
    respond_with(chat)
  end

  def new
    respond_with(chat)
  end

  def edit
    respond_with(chat)
  end

  def create
    params[:chat][:user_ids].push current_user.id
    
    respond_with(chat) { chat.save }
  end

  def update
    params[:chat][:user_ids].push current_user.id
    
    respond_with(chat) { chat.update(chat_params) }
  end

  def destroy
    respond_with(chat) { chat.destroy }
  end

  private
    def chat_params
      params.require(:chat).permit(:name, user_ids: [])
    end
end
  