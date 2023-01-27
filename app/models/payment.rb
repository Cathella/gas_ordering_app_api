class Payment < ApplicationRecord
  # validations
  validates :method, presence: true
  validates :status, presence: true
  validates :total_amount, presence: true

  # relationships
  belongs_to :order
  belongs_to :delivery

  before_save :calculate_total_amount

  private

    def calculate_total_amount
      self.total_amount = order.total_price + delivery.fees
    end
end
