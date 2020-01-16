class Admin::OrdersController < Admin::ApplicationController
  def index
  	@orders = Order.all
    @order_products = OrderProduct.all
  end

  def show
  	@order = Order.find(params[:id])
    @order_products = @order.order_products
  	@user = User.find_by(params[:user_id])
  end

  def update
    @order = Order.find(params[:id])
     @order_product.update(order_product_params)
     @order_products = @order.order_products
     @order.order_products.build
     # @status = []
     # @status << @order_products
    #  if params[:order][:status].to_sym == :conf_payment
    #     @order_product.status = :wait_product
    #     @order.update(order_params)
    #  elsif params[:order_product][:status].to_sym == :now_product
    #     @order.status = :in_product
    #     @order.update(order_params)
    # elsif params[:order_product][:status].to_sym == :comp_product
    #     @order.status = :wait_shipping
    #     @order.update(order_params)
    # else
    # end

     # if @status.any?{|n| n = :now_product}
     #     @order.status << :in_product
     #     @order.update(order_params)
     # elsif @status.any?{|n| n = :comp_product}
     #       @order.status << :wait_shipping
     #       @order.update(order_params)
     # else
     # end

     redirect_to admin_order_path(@order)
  end

  private
  	def order_params
  		params.require(:order).permit(:deli_address_id, :user_id, :payment, :status, :pay_method, :postage,
        order_products_attributes: [:order_id, :product_id, :total, :quantity, :status])
  	end

    def order_product_params
      params.require(:order_product).permit(:order_id, :product_id, :total, :quantity, :status)
    end
end
