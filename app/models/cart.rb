class Cart < ApplicationRecord
	has_many :order_items, dependent: :destroy
	# belongs_to :order
	belongs_to :user
	has_one :order, dependent: :destroy

	default_scope {order(created_at: :desc)}

	def total_quantity
		@count = 0

		order_items.all.each do |item|
			@count = @count + item.quantity
		end

		@count
	end

	def total_price
		@total_price = 0

		self.order_items.all.each do |item|
			@total_price += item.product.price * item.quantity
		end

		@total_price
	end

	def total_price_in_usd
		total_price / 100
	end

end
