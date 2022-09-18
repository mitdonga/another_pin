class ProductsController < ApplicationController
  def index
		@products = Product.all
  end

  def show
		@product = Product.find(params[:id])

		@order_items = @product.order_items.find_by(product: @product)

		if @order_items.nil?
			@order_items = @product.order_items.new(product: @product, quantity: 1)
		end
  end
	
end
