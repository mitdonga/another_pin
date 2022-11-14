class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	before_action :configure_permitted_parameters, if: :devise_controller?
	
	before_action :current_cart
	helper_method :current_cart


	def current_cart
		if user_signed_in?

			cart = Cart.find_by(user: current_user)

			if cart.nil?
				# cart = current_cart.carts.new
				@current_cart = Cart.create(user: current_user)
				puts "Cart is nil"
			else
				@current_cart = cart
				puts "cart is not nil"
			end

			puts "========================= Current Cart Is  #{@current_cart.id} ====================================="
			puts "========================= Session Is  #{session[:user_id]} ====================================="
			puts "========================= User Id Is  #{current_user.id} ====================================="
			# @current_cart = current_user.cart
		# else
			# redirect_to new_user_session_path
		end

		# @current_cart = Cart.find_or_create_by(id: session[:user_id])
		# if session[:cart_id].present?
		# 	@current_cart = Cart.find(session[:cart_id])
		# else
		# 	@current_cart = Cart.create
		# 	session[:cart_id] = @current_cart.id
		# end
	end	

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :first_name, :last_name, :phone_number, :address, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :first_name, :last_name, :phone_number, :address, :password, :password_confirmation, :current_password])
  end

	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.

	# before_action :configure_permitted_parameters, if: :devise_controller?

	# protected

	# def configure_permitted_parameters
	# 	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :user_name, :first_name, :last_name, :phone_number, :address) }
	# 	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :user_name, :first_name, :last_name, :phone_number, :address) }
	# end
end
