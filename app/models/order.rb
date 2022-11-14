class Order < ApplicationRecord
	has_many :order_items
	belongs_to :cart
	belongs_to :user

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true
	validates :address_1, presence: true
	validates :city, presence: true
	validates :country, presence: true

	def get_items
		self.cart.order_items
	end

end
