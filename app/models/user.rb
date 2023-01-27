class User < ApplicationRecord
  # validation
  validates :phone_number, presence: true, uniqueness: true
  validates :role, presence: true, inclusion: { in: %w(admin customer) }

  # relationships
  has_many :products
  has_many :orders
end
