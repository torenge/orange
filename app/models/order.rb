class Order < ApplicationRecord
	belongs_to :user
	has_many :order_products, dependent: :destroy
	has_many :deli_addresses, dependent: :destroy

	 acts_as_paranoid
end
