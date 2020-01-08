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
    
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'order_products/index'
    get 'order_products/new'
    get 'order_products/show'
  end
  namespace :admin do
    get 'products/new'
    get 'products/index'
    get 'products/show'
    get 'products/edit'
  end
  namespace :public do
    get 'products/index'
    get 'products/show'
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end