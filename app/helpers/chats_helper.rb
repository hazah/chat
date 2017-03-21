module ChatsHelper
  def chat_name(chat)
    chat.name.present? ? chat.name : chat.users.where.not(id: current_user.id).pluck(:email).to_sentence
  end
end
