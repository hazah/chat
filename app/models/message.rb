class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  after_create_commit { BroadcastMessageJob.perform_later(id) }
end
