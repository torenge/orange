class Public::OrderProductsController < Public::ApplicationController
  def index
  end

  def edit
    @user = current_user
    @order = Order.find(params[:id])
    @deli_addresses = @user.deli_addresses
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @user = current_user
    if params[:order][:address_choice] == "1"
      @order.address = current_user.address
      @order.postal_code = current_user.postal_code
      @order.first_name = current_user.first_name
      @order.last_name = current_user.last_name
      if params[:order][:pay_method] == "1"
        @order.pay_method = "クレジットカード"
      end
      if params[:order][:pay_method] == "2"
        @order.pay_method = "銀行振込"
      end
      @order.save
      redirect_to public_order_check_path(@order)
    end

    if params[:order][:address_choice] == "2"
      @deli_address = DeliAddress.find(params[:order][:deli_address_id])
      @order.address = @deli_address.address
      @order.postal_code = @deli_address.postal_code
      @order.first_name = @deli_address.first_name
      @order.last_name = @deli_address.last_name
      if params[:order][:pay_method] == "1"
        @order.pay_method = "クレジットカード"
      end
      if params[:order][:pay_method] == "2"
        @order.pay_method = "銀行振込"
      end
      @order.save
      redirect_to public_order_check_path(@order)
    end

    if params[:order][:address_choice] == "3"
      if params[:order][:pay_method] == "1"
        @order.pay_method = "クレジットカード"
      end
      if params[:order][:pay_method] == "2"
        @order.pay_method = "銀行振込"
      end
      @order.update(order_params)
      redirect_to public_order_check_path(@order)
    end

  end

  private
  def order_params
    params.require(:order).permit(:deli_address_id, :address, :postal_code, :first_name, :last_name)
  end

  def deli_address_params
    params.require(:deli_address).permit(:postal_code, :address, :first_name, :last_name)
  end

end
