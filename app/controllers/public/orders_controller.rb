class Public::OrdersController < Public::ApplicationController

  def index
    @orders = Order.where(user_id: current_user.id)
    @total = []
    # コントローラー上だけでは、各注文の配列が並んでいるだけ[１回目の@pp、２回目の@pp、３回目の@pp]
    @i = 0
    @orders.each do |order|
      @products_prices = []
      #毎回、使い捨てにすべく、@products_pricesの中身をからにする
      @order_products = order.order_products
      @order_products.each do |order_product|
        @products_prices << order_product.quantity.to_i * (order_product.total.to_i * 1.1).round(0)
      end
      # 配列の個数が2以上なら
      if @products_prices.count > 1
        @total << @products_prices.sum
       #@products_pricesの中身(それぞれの商品の:totalカラムの値)を合計して,@total(配列)のなかに代入
      else
        #配列の個数が１つなら、@products_pricesの中身で取り出して、@totalに代入
        @total << @products_prices[0]
      end
    end
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
