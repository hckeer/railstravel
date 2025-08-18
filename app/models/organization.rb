# app/models/organization.rb
class Organization < ApplicationRecord
  has_many :chat_rooms, dependent: :restrict_with_error
  has_many :messages, as: :user
end