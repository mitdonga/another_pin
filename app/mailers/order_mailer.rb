class OrderMailer < ApplicationMailer

	default from: "mit@anotherpin.com"
	# layout 'invoice.html.erb'

	def invoice(order)
		@order = order
		mail(to: @order.email, subject: "Thank you for buying from AnotherPin.Co")
	end

end
