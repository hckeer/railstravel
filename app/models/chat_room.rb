# app/models/chat_room.rb
class ChatRoom < ApplicationRecord
  belongs_to :organization
  has_many :messages, dependent: :destroy
  has_many :clients, -> { distinct }, through: :messages, 
           source: :user, source_type: 'Client'
end