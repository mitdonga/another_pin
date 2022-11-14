class OrdersController < ApplicationController

	def index
		@orders = current_user.orders.order(created_at: :desc)
	end

	def new
		@order = Order.new
		# @order.cart = @current_cart
		# @order.
	end


	def show
		@order = Order.find(params[:id])
	end

	def create

		@order = Order.new(form_params)
		@order.user = current_user
		@order.cart = @current_cart
		
		if @order.save
			
			new_cart = Cart.new(user: current_user)

			if new_cart.save
				@current_cart = new_cart
				flash[:success] = "Success! Your Order Has Been Confirmed"
				redirect_to root_path
			else
				flash[:error] = "Oops, Error while saving cart"
			end
		else 
			flash[:error] = "Oops, Error while saving order"
		end
			
	end 

	private

	def form_params
		params.require(:order).permit(:first_name, :last_name, :email, :country, :address_1, :address_2, :city, :postal_code)
	end
end
