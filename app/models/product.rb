class Product < ApplicationRecord
  # validations
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :inventory, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :weight, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :order_type, presence: true, inclusion: { in: %w(refill fullset) }

  # relationships
  belongs_to :user
  has_many :orders
end
