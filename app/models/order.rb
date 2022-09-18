class Order < ApplicationRecord
	has_many :order_items, dependent: :destroy

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true
	validates :address_1, presence: true
	validates :city, presence: true
	validates :country, presence: true
end