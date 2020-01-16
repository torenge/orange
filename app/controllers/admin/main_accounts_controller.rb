class Admin::MainAccountsController < Admin::ApplicationController
  def index
  	@order = Order.all

  end

  private
  	def order_params
  		params.require(:order).permit(:deli_address_id, :user_id, :payment, :status, :pay_method, :postage)
  	end
end
