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

	def save_and_charge
		if self.valid?
			Stripe::Charge.create(
				amount: self.total_value.to_i,
				currency: "inr",
				source: self.stripe_token,
				description: "Order for #{self.email} of amount $#{self.total_value}"
			)
			self.save
		else
			false
		end
	rescue Stripe::CardError => e
		@message = e.json_body[:error][:message]
		self.errors.add(:stripe_error, @message)
	end

	def get_items
		self.cart.order_items
	end

	def total_value
		@total_price = 0

		self.get_items.each do |item|
			@total_price += item.product.price * item.quantity
		end

		@total_price
	end

end
