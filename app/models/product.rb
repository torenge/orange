class Product < ApplicationRecord
	belongs_to :genre
	belongs_to :cart
	has_many :order_products, dependent: :destroy
end
