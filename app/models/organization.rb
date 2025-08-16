class Organization < ApplicationRecord
  has_many :posts, as: :author
  has_many :applications, through: :posts
end