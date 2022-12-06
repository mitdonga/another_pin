class OrdersController < ApplicationController

	before_action :require_login

	def index
		@orders = current_user.orders.order(created_at: :desc)
	end

	def new
		@order = Order.new
	end


	def show
		@order = Order.find(params[:id])
	end

	def create

		@order = Order.new(form_params)
		@order.user = current_user
		@order.cart = @current_cart
		
		if @order.save_and_charge && @order.errors.blank?
			
			new_cart = Cart.new(user: current_user)

			if new_cart.save
				@current_cart = new_cart
				flash[:success] = "Success! Your Order Has Been Confirmed"
				redirect_to root_path
			else
				flash[:error] = "Oops, Error while saving cart"
			end
		else 
			flash[:error] = "Oops, something went wrong, Please try again"
			render :new
		end
			
	end 

	def require_login
		unless user_signed_in?
			flash[:error] = "Please Login or Signup"
			redirect_to root_path
		end
	end

	private

	def form_params
		params.require(:order).permit(:first_name, :last_name, :email, :country, :address_1, :address_2, :city, :postal_code, :stripe_token)
	end
end
