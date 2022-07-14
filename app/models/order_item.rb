class OrderItem < ApplicationRecord
  # Relationships
  belongs_to :order
  belongs_to :product
end
