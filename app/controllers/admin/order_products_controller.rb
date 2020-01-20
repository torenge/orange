class Admin::OrderProductsController < Admin::ApplicationController
	def update
		@order = Order.find(params[:order_id])
		@order_product = OrderProduct.find(params[:id])
		@order_product.save
		@order_product.update(order_product_params)
	end

	private
		def order_product_params
      		params.require(:order_product).permit(:order_id, :product_id, :total, :quantity, :status)
    	end
end
