class Public::OrdersController < Public::ApplicationController
  def index
  @orders = Order.where(:order_user_id == current_user.id)
  @order_products = OrderProduct.where(:order_product_id == :order_id)
  @product = Product.find_by(params[:order_product_id])
  end


  def show
    @order = Order.find(params[:id]
 end

  def check
  	@order = Order.find(params[:id])
  end

end

  private
  def order_product_params
  	params.require(:order_product).permit(:total, :quantity, :product_id)
  end
end
