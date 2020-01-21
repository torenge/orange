class Admin::OrdersController < Admin::ApplicationController
  def index
  	@orders = Order.all.order("id DESC").page(params[:page]).per(10)
  end

  def user_orders
    @user = User.with_deleted.find(params[:id])
    @orders = Order.where(user_id: @user).order("id DESC").page(params[:page]).per(10)
  end

  def today
    @orders = Order.where(created_at: Time.zone.now.all_day).order("id DESC").page(params[:page]).per(10)
  end

  def show
  	@order = Order.find(params[:id])
  	@user = User.with_deleted.find_by(params[:user_id])
  	@deli_address = DeliAddress.find_by(params[:deli_address_id])
    @order_products = OrderProduct.all
    @product = Product.find_by(params[:product_id])

    @total = []

    @order.order_products.each do |order_product|
      @total << order_product.quantity.to_i * (order_product.total.to_i * 1.1).round(0)
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @status = []
    @order.order_products.each do |order_product|
      @status << order_product.status
    end
    if "製作中".in?(@status)
      @order.status = "製作中"
      @order.save
      p "aaa"
    elsif params[:order][:status] == "発送済み"
    elsif @status.all? {|n| n == "製作完了"}
      @order.status = "発送準備中"
      @order.save
      p "bbb"
    elsif params[:order][:status] == "入金確認"
      @order.order_products.each do |order_product|
        order_product.status = "製作待ち"
      end
      p "ccc"
      @order.save
    else
    end

    redirect_to admin_order_path(@order)
  end

 private
  	def order_params
  		params.require(:order).permit(:deli_address_id, :user_id, :payment, :status, :pay_method, :postage, order_products_attributes: [:id, :status, :_destroy])
  	end

    def order_product_params
      params.require(:order_product).permit(:order_id, :product_id, :total, :quantity, :status)
    end
end
