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
    @order_products = OrderProduct.where(order_id: @order.id)
    @order_products.update(order_params)
    @order_product = OrderProduct.find_by(params[:order_product_id])
     if     params[:order][:status] == '入金確認'

 
         @order_products.update_all(status:'製作待ち')
      # elsif  @order_product.status  == '製作中'
      #        @order.update(status:'製作中')
      #        @order_product.update(status:'製作中')
    
     end
     @order.update(order_params)
       redirect_to admin_genres_path

    #  # elsif @order.update(order_params)
    #     # redirect_to admin_genres_path
    #  # elsif @order_product.status == '製作完了'
    #     # @order.status = '発送準備中'
    #     # @order_product.update(order_prduct_params)
    #     # @order.update(order_params)
    #     # redirect_to admin_order_path(@order)
    # else
    # redirect_to admin_order_path(@order)
    # end
end

  private
  	def order_params
  		params.require(:order).permit(:deli_address_id, :user_id, :payment, :status, :pay_method, :postage, order_product_attributes:
        [
          :status
        ]
        )
  	end

    def order_product_params
      params.require(:order_product).permit(:order_id, :product_id, :total, :quantity, :status)
    end

end
