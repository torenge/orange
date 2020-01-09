class Public::CartsController < ApplicationController
  def index
    @user = current_user
  	@cart = Cart.find(params[:id])
    price = @cart.product.price * 1.1
  end

  def create #OP作成
    @cart = @cart.find(params[:id])
  	@order_product = OrderProduct.new(order_params)
    @order_product.total = (@cart.product.price * 1.1).round(0)
  	@order_product.user_id = current_user.id
  	@order_product.save!
    @cart.destroy
  	redirect_to new_public_order_product_path(@order_product)
  end

  def update
  	@cart = Cart.find(params[:id])
  	@cart.update(cart_params)
  	redirect_to public_carts_path
  end

  def destroy
  	@cart = Cart.find(params[:id])
  	@cart.destroy
  end

  private
  def cart_params
  	params.require(:cart).permit(:quantity)
  end
end
