json.extract! chat, :id, :name, :user_ids, :created_at, :updated_at
json.url chat_url(chat, format: :json)
