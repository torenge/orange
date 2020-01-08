Rails.application.routes.draw do
  namespace :admin do
    get 'main_accounts/index'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :public do
    get 'deli_addresses/index'
    get 'deli_addresses/edit'
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
