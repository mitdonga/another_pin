class PagesController < ApplicationController
	def info
		
	end

	def home
		@featured_products = Product.where(is_featured: true)
	end
end
