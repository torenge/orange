class Public::OrdersController < Public::ApplicationController
  def index
    @orders = Order.where(user_id: current_user.id).order("id DESC")
  end

  def show
    @order = Order.find(params[:id])
    @total = []
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
  def order_params
      params.require(:order).permit(:deli_address_id, :user_id, :payment, :status, :pay_method, :postage, order_products_attributes: [:id, :status, :_destroy])
    end

  def order_product_params
  	params.require(:order_product).permit(:total, :quantity, :product_id)
  end
end
