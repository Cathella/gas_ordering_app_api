class Order < ApplicationRecord
  # validations
  validates :status, presence: true, inclusion: { in: %w(pending shipped delivered) }
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :weight, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :order_type, presence: true, inclusion: { in: %w(refill fullset) }

  # relationships
  belongs_to :user
  belongs_to :product
  has_one :payment
  has_one :delivery, dependent: :destroy

  def calculate_total_price
    self.total_price = quantity * product.price
  end
end
