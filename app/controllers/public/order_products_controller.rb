class Public::OrderProductsController < ApplicationController
  def index
  end

  def edit
    @user = current_user
    @order = Order.find(params[:id])
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update
    redirect_to order_product_path(@order)
    #自分の住所を選択した場合はdeli_address_idを取得しない
    #お届け先で新しいお届け先を選択した場合、入力したものをdeli_addressで新規作成、それをdeli_address_idに流す
  end

  def create
    @deli_address = DeliAddress.new
    @deli_address.save
  end

  private
  def order_params
    params.require(:order).permit(:deli_address_id)
  end


end
