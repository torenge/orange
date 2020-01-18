class Public::ProductsController < Public::ApplicationController
  def index
    @products = Product.all
    @product = Product.page(params[:page]).per(8)
    @genres = Genre.where(genre_status: "有効")
    @genre = Genre.find_by(params[:id])
  end

  def genreshow
    @products = Product.all
  	@genres = Genre.where(genre_status: "有効")
  	@genre = Genre.find(params[:id])
    @product = @genre.products.page(params[:page]).per(8)
  end

  def show
    @genres = Genre.where(genre_status: "有効")
    @product = Product.find(params[:id])
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(cart_params)
    @cart.user_id = current_user.id
    @cart.save!
    redirect_to public_carts_path
  end

  private
  def product_params
    params.require(:product).permit(:genre_id, :product_name, :price, :introduction, :product_image_id)
  end
  def cart_params
    params.require(:cart).permit(:product_id, :user_id, :quantity)
  end
end
