class Message < ApplicationRecord
  belongs_to :chat_room
  belongs_to :user, polymorphic: true
  
  after_create_commit { broadcast_append_to chat_room }
end