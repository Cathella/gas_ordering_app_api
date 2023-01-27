class Delivery < ApplicationRecord
  # validations
  validates :location, presence: true
  validates :fees, presence: true
  validates :status, presence: true
  
  # relationships
  belongs_to :order

  def calculate_fees
    # Logic to calculate fees based on location
  end
end
