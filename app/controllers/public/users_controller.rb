class Public::UsersController < Public::ApplicationController

   before_action :login_check, only: [:show,:edit, :update,:withdraw,:destroy]

    def index
	    @products = Product.page(params[:page]).per(8)
  		@genres = Genre.all
  		@genre = Genre.find_by(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def show
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
			if @user.update(user_params)
	            redirect_to public_user_path(@user.id)
	        else
	        	render :edit
	        end
	end

	def withdraw
	    @user = User.find(params[:id])
	end

	def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to public_products_path
	end

private

	def user_params
	    params.require(:user).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :address, :tel_num, :email)
	end

    def login_check
         @user = User.find(params[:id])
            unless  @user.id == current_user.id
                    redirect_to public_products_path
            end
    end
end