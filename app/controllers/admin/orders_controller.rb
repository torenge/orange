class Admin::OrdersController < Admin::ApplicationController
  def index
  	@orders = Order.all
    @order = Order.find(params[:id])
    @quantity = []
    @order.order_products.each do |order_product|
      @quantity << order_products.quantity.to_i
    end
  end

  def show
  	@order = Order.find(params[:id])
  	@user = User.find_by(params[:user_id])
    @product = Product.find_by(params[:product_id])
  end

  def update
    @order = Order.find(params[:id])
    @order_product = @order.order_products
    if params[:order][:status] == "入金確認"
      @order.order_products.each do |order_product|
        order_product.status = "製作待ち"
      end
    end
#    if @order_product.status == '製作中'
#        @order.status = '製作中'
#        @order.update(order_params)
#    end
#    if @order_product.status == '製作完了'
#        @order.status = '発送準備中'
#        @order.update(order_params)
#    end

    @order.save
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
