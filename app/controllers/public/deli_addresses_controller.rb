class Public::DeliAddressesController < ApplicationController

   before_action :login_check, only: [:edit,:update,:destroy]

  def index
    @user = current_user
    @deli_addressesx = DeliAddress.new
    @deli_addresses = @user.deli_addresses.all
  end

  def create
    @user = current_user
    @deli_addresses = @user.deli_addresses.all
    @deli_addressesx = DeliAddress.new(deli_address_params)
    @deli_addressesx.user_id = current_user.id
     if @deli_addressesx.save
        redirect_to public_deli_addresses_path
     else
        render :index
     end
  end

  def edit
    @deli_addresses = DeliAddress.find(params[:id])
  end

  def update
    @deli_addresses = DeliAddress.find(params[:id])
      if @deli_addresses.update(deli_address_params)
         redirect_to public_deli_addresses_path
      else
         render :edit
      end
  end

  def destroy
    @deli_addresses = DeliAddress.find(params[:id])
    @deli_addresses.destroy
    redirect_to public_deli_addresses_path
  end


private
    def deli_address_params
        params.require(:deli_address).permit(:postal_code, :address, :first_name, :last_name)
    end

    def login_check
      @deli_address = DeliAddress.find(params[:id])
       unless  @deli_address.user.id == current_user.id
               redirect_to public_products_path
       end
    end
end