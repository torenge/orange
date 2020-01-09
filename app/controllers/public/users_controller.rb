class Public::UsersController < ApplicationController
	def index
	end

	def edit
		@user = User.find(params[:id])
	end

	def show
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
        redirect_to public_user_path(@user.id)

	end

	def withdraw
     @user = User.find(params[:id])
	end

private
def user_params
    params.require(:user).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :address, :tel_num, :email)
end

end
