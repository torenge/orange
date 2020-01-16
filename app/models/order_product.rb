class OrderProduct < ApplicationRecord
	belongs_to :order
	belongs_to :product

	enum status:{cant_start: 0, wait_product: 1, now_product: 2, comp_product: 3}


end
