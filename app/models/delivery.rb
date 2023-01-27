class Delivery < ApplicationRecord
  # validations
  validates :location, presence: true
  validates :fees, presence: true
  validates :status, presence: true
  
  # relationships
  belongs_to :order

  def calculate_fees
    # Logic to calculate fees based on location
    location ||= 'Namugongo'

    case location
      when 'Namugongo'
        self.fees = 2000.00
      when 'Kira'
        self.fees = 3000.00
      when 'Kireka'
        self.fees = 2500.00
      else
        self.fees = 4000.00
    end
  end
end
