class Product < ApplicationRecord
  # Relationships
  has_and_belongs_to_many :categories
  has_many :order_items
  has_many :orders, through: :order_items
  
  def get_category(product_id)
    product = Product.find(product_id)
    if product && (product.stock > 0)
      order_items.create(product_id: product.id, quantity: quantity, price: product.price)
      total_value
    end
  end
end
