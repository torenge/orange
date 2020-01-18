class Admin::UsersController < Admin::ApplicationController
	def index
		@users = User.with_deleted.order(:id).page(params[:page]).per(params[10])
	end

	def show
		@user = User.with_deleted.find(params[:id])
	end

	def edit
		@user = User.with_deleted.find(params[:id])
	end

	def update
		@user = User.with_deleted.find(params[:id])

		if @user.update(user_params)
			redirect_to admin_user_path(@user)

			if params[:user][:deleted_at] == "有効"
				@user.restore
			elsif params[:user][:deleted_at] == "退会済み"
				@user.destroy
			end
		else 
			render :edit
		end
	end

	private
		def user_params
	    params.require(:user).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :address, :tel_num, :email, :deleted_at)
	end

end
