class Admin::MainAccountsController < Admin::ApplicationController
  def index
  	@orders = Order.where(created_at: Time.zone.now.all_day)
  end

  private
  	def order_params
  		params.require(:order).permit(:deli_address_id, :user_id, :payment, :status, :pay_method, :postage)
  	end
end
