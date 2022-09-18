class Product < ApplicationRecord

	has_many :order_items, dependent: :destroy
	
	validates :title, presence: true
	validates :description, presence: true
	validates :price, presence: true
	
	mount_uploader :image_1, ProductImageUploader
	mount_uploader :image_2, ProductImageUploader
	mount_uploader :image_3, ProductImageUploader
	mount_uploader :image_4, ProductImageUploader
	mount_uploader :image_5, ProductImageUploader

	def number_to_usd
		price / 100
	end
	
end
