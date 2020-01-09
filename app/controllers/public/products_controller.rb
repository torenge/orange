class Public::ProductsController < ApplicationController
  def index
  	@products = Product.page(params[:page]).per(8)
  	@genres = Genre.all
  	@genre = Genre.find(params[:id])
  	price = product.price * 1.1
  end

  def show
  	@genres = Genre.all
  	@genre = Genre.find(params[:id])
  	@product = Product.find(params[:id])
    price = product.price * 1.1
  end

  def create
    @product = Product.find(params[:id])
    @cart = Cart.new
    @cart.product_id = @product.id
    @cart.user_id = current_user.id
    redirect_to pablic_carts_path
  end

  private
  def product_params
    params.require(:product).permit(:genre_id, :product_name, :price, :introduction, :product_image_id)
  end
end
