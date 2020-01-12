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
  end

  private
  	def order_params
  		params.require(:order).permit(:deli_address_id, :user_id, :payment, :status, :pay_method, :postage, :deleted_at)
  	end
end
