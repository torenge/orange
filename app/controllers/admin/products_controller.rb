class Admin::ProductsController < Admin::ApplicationController
  def new
    @product = Product.new
    @genres = Genre.all
    @genre = Genre.find_by(params[:genre_id])
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_product_path(@product)
  end

  def index
    @products = Product.order(:id).page(params[:page]).per(params[10])
  end

  def show
    @product = Product.find(params[:id])
    @genre = Genre.find_by(params[:genre_id])
  end

  def edit
    @product = Product.find(params[:id])
    @genres = Genre.all
    @genre = Genre.find_by(params[:genre_id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admin_product_path(@product)
  end

  private
    def product_params
      params.require(:product).permit(:genre_id, :product_name, :price, :introduction, :status, :product_image, :created_at, :updated_at)
    end
end
