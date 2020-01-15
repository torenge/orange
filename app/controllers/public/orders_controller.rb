class Public::OrdersController < Public::ApplicationController
  def index

  end

  def show
  end

  def check
  	@order = Order.find(params[:id])
    @total = []
    @order.order_products.each do |order_product|
      @total << order_product.quantity.to_i * (order_product.total.to_i * 1.1).round(0)
    end
  end
  private
  def order_product_params
  	params.require(:order_product).permit(:total, :quantity, :product_id)
  end
end
