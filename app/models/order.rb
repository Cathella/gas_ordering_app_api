class Order < ApplicationRecord
  # validations
  validates :status, presence: true, inclusion: { in: %w(pending shipped delivered) }
  validates :quantity, presence: true, numericality: { greater_than: 0 }

  # relationships
  belongs_to :user
  belongs_to :product
  has_one :payment
  has_one :delivery, dependent: :destroy

  def calculate_total_price
    self.total_price = quantity * product.price
  end
end
