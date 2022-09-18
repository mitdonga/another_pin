class OrdersController < ApplicationController
	def new
		@order = Order.new
	end

	def create
		@order = Order.new(form_params)

		if @order.save
			redirect_to order_path(@order)
		else
			render "new"
		end
	end

	def show
		@order = Order.find(params[:id])
	end

	private

	def form_params
		params.require(:order).permit(:first_name, :last_name, :email, :country, :address_1, :address_2, :city, :postal_code)
	end
end
