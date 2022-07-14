class CartsController < ApplicationController

  def update
    product = params[:cart][:product_id]
    quantity = params[:cart][:quantity]
    current_order.add_product(product, quantity)
    redirect_to root_url, notice: "Product added successfuly"
  end

  def show
    @order = current_order
  end
end
