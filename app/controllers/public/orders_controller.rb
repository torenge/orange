class Public::OrdersController < Public::ApplicationController

  def index
  @orders = Order.where(:order_user_id == current_user.id)
  @order_products = OrderProduct.where(:order_product_id == :order_id)
  @product = Product.find_by(params[:order_product_id])
  @total = []
    order.order_products.each do |order_product|
      @total << order_product.quantity.to_i * (order_product.total.to_i * 1.1).round(0)
  end
end

  def show
    @order = Order.find(params[:id])
    @order.order_products.each do |order_product|
      @total << order_product.quantity.to_i * (order_product.total.to_i * 1.1).round(0)
end
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
