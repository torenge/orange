class Public::OrdersController < Public::ApplicationController
  def index

  end

  def show
  end

  def check
  	@order = Order.find(params[:id])
  end
  private
  def order_product_params
  	params.require(:order_product).permit(:total, :quantity, :product_id)
  end
end
