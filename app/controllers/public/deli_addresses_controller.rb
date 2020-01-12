class Public::DeliAddressesController < ApplicationController
  def index
    @user = current_user
    @deli_addressesx = DeliAddress.new
    @deli_addresses = @user.deli_addresses.all
  end

  def create
    @deli_addressesx = DeliAddress.new(deli_address_params)
    @deli_addressesx.user_id = current_user.id
    @deli_addressesx.save
    redirect_to public_deli_addresses_path
    end

  def edit
    @deli_addresses = DeliAddress.find(params[:id])
  end

  def update
    @deli_addresses = DeliAddress.find(params[:id])
    @deli_addresses.update(deli_address_params)
    redirect_to public_deli_addresses_path
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
    end