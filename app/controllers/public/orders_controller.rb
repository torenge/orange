class Public::OrdersController < ApplicationController
  def index
  	@user = current_user
  	@orders = @user.orders.all
  end

  def show
  end
end
