# app/models/client.rb
class Client < ApplicationRecord
  has_many :messages, as: :user
  has_many :chat_rooms, -> { distinct }, through: :messages
  
  # Add these associations for job applications
  has_many :applications
  has_many :applied_posts, through: :applications, source: :post
end