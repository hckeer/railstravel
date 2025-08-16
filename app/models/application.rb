class Application < ApplicationRecord
  belongs_to :post
  belongs_to :client
  validates :status, inclusion: { in: %w[pending accepted rejected] }
end