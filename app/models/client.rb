class Client < ApplicationRecord
  has_many :posts, as: :author
  has_many :applications
  has_many :applied_posts, through: :applications, source: :post
end