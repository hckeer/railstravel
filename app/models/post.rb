class Post < ApplicationRecord
  belongs_to :author, polymorphic: true
  has_many :applications, dependent: :destroy
  has_many :applicants, through: :applications, source: :client
end
