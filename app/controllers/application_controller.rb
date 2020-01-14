class ApplicationController < ActionController::Base


    before_action :authenticate_user!, except: [:index]
    before_action :configure_permitted_parameters, if: :devise_controller?

protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :address, :tel_num])
    end

end
