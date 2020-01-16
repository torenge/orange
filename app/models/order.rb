class Order < ApplicationRecord
	belongs_to :user
	has_many :order_products, dependent: :destroy
	has_many :deli_addresses, dependent: :destroy

	accepts_nested_attributes_for :order_products

	enum status: {wait_payment: 0, conf_payment: 1, in_product: 2, wait_shipping: 3, sent: 4}
end
