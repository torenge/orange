class Admin::OrdersController < Admin::ApplicationController
  def index
  	@orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
  	@user = User.find_by(params[:user_id])
  	@deli_address = DeliAddress.find_by(params[:deli_address_id])
    @order_product = OrderProduct.all
  end

  def update
    @order = Order.find(params[:id])

    if order.status == 2
        order_product.status => 2
        @order_product.(order_product_params)
    elsif order_product.status == 3
          order.status => 3
          @order.update(order_params)
    elsif order_product.status == 4
          order.status => 4
          @order.update(order_params)
    else
        redirect_to admin_order_path(order.id)
    end
  end

  private
  	def order_params
  		params.require(:order).permit(:deli_address_id, :user_id, :payment, :status, :pay_method, :postage)
  	end
end
