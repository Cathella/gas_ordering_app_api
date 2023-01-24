class Order < ApplicationRecord
  # each product can have many orders, 
  # and each order can have many products.
  
  has_many :order_items
  has_many :products, through: :order_items
end
