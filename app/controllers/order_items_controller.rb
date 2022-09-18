class OrderItemsController < ApplicationController
	def create
		@product = Product.find(params[:product_id])
		@quantity = form_params[:quantity]
		@current_cart.order_items.create(product: @product, quantity: @quantity)
		flash[:success] = "Product successfully added to your cart"
		redirect_to product_path(@product)
	end

	def update
		@product = Product.find(params[:product_id])
		@order_item = OrderItem.find(params[:id])
		@order_item.update(form_params)
		flash[:success] = "Your cart has been updated successfully"
		redirect_to product_path(@product)
	end

	def destroy
		@product = Product.find(params[:product_id])
		@current_cart.order_items.where(product: @product).destroy_all
		redirect_to @current_cart
	end

	private
	
	def form_params
		params.require(:order_item).permit(:quantity)
	end

end
