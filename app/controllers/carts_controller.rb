class CartsController < ApplicationController



	def show
		unless user_signed_in?
			flash[:error] = "Please Login or Signup"
			redirect_to root_path
		else
			@order_items = OrderItem.includes(:product).where(cart_id: @current_cart.id)
		end

	end
end
