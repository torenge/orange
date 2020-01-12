class Public::OrderProductsController < ApplicationController
  def index
    @order_product = OrderProduct.find(params[:id])
  end

  def new
  end

  def create
  end

  def show
  end

  def update
  end
end
