class Admin::OrdersController < Admin::ApplicationController
  def index
  	@orders = Order.all
    @order_products = OrderProduct.all
    @users = User.all
  end

  def show
  	@order = Order.find(params[:id])
  	@user = User.find_by(params[:user_id])
  	@deli_address = DeliAddress.find_by(params[:deli_address_id])
    @order_products = OrderProduct.all
    @product = Product.find_by(params[:product_id])
  end

  def update
    @order = Order.find(params[:id])
    @order_product = OrderProduct.find_by(params[:order_product_id])
    if @order.status == '入金確認'
        @order_product.status = '製作待ち'
        @order.update(order_params)
    elsif @order_product.status == '製作中'
        @order.status = '製作中'
        @order.update(order_params)
    elsif @order_product.status == '製作完了'
        @order.status = '発送準備中'
        @order.update(order_params)
    else
    end
    redirect_to admin_order_path(@order)
  end

  private
  	def order_params
  		params.require(:order).permit(:deli_address_id, :user_id, :payment, :status, :pay_method, :postage)
  	end

    def order_prduct_params
      params.require(:order_product).permit(:order_id, :product_id, :total, :quantity, :status)
    end
end
