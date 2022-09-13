class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	before_action :configure_permitted_parameters, if: :devise_controller?

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
