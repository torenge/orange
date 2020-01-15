class Public::CartsController < Public::ApplicationController
  def index
    @user = current_user
    @total = []
    @user.carts.each do |cart|
      @total << cart.quantity.to_i * (cart.product.price.to_i * 1.1).round(0)
    end
    @order = Order.new
  end

  def update
    @cart = Cart.find(params[:id])
    @cart.update(cart_params)
    redirect_to public_carts_path
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to public_carts_path
  end

  def create
    @user = current_user

    @order = Order.new
    @order.user_id = current_user.id
    @order.postage = 800
    @order.save!

    @user.carts.each do |cart|
      order_product = OrderProduct.new
      order_product.order_id = @order.id
      order_product.quantity = cart.quantity
      order_product.product_id = cart.product_id
      order_product.total = cart.product.price
      order_product.save
    end

    @user.carts.delete_all

  	redirect_to edit_public_order_product_path(@order)
  end

  def delete_all
    @user = current_user
    @user.carts.delete_all
    redirect_to public_carts_path
  end

  private
  def cart_params
  	params.require(:cart).permit(:quantity)
  end
end
