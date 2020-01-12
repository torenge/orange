class Public::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(8)
    @genres = Genre.all
    @genre = Genre.find_by(params[:id])
  end

  def genreshow
    @products = Product.page(params[:page]).per(8)
  	@genres = Genre.all
  	@genre = Genre.find_by(params[:id])
  end

  def show
  	@genres = Genre.all
  	@genre = Genre.find(params[:id])
  	@product = Product.find(params[:id])
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(cart_params)
    @cart.user_id = current_user.id
    @cart.save!
  end

  private
  def product_params
    params.require(:product).permit(:genre_id, :product_name, :price, :introduction, :product_image_id)
  end
  def cart_params
    params.require(:cart).permit(:product_id, :user_id, :quantity)
  end
end
