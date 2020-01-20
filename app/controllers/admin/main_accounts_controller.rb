class Admin::MainAccountsController < Admin::ApplicationController
  def index
  	@orders = OrderProduct.where(created_at: Time.zone.now.all_day)
  end
end
