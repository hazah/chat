class CreateChatsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :chats_users do |t|
      t.references :chat, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
    end
  end
end
