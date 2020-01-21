  Rails.application.routes.draw do

  root 'public/products#index'
  get 'public/products/genreshow/:id' => "public/products#genreshow", as: "public_product_genreshow"
  get 'public/orders/check/:id' => "public/orders#check", as: "public_order_check"
  delete 'public/carts' => "public/carts#delete_all"
  get 'public/users/:id/withdraw' => 'public/users#withdraw', as: 'withdraw_public_user'
  get 'admin/orders/today' => "admin/orders#today", as: "admin_order_today"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

    namespace :public do
      resources :users, only: [:index, :edit, :show, :update, :withdraw, :destroy]
      resources :deli_addresses, only: [:index, :create, :edit, :update, :destroy]
      resources :carts, only: [:index, :create, :update, :destroy, :delete_all]
      resources :products, only: [:index, :genreshow, :show, :create]
      resources :order_products, only: [:index, :edit, :show, :update, :create]
      resources :orders, only: [:index, :show, :check]
    end


    namespace :admin do
      resources :users, only: [:index, :edit, :show, :update]
      resources :genres, only: [:index, :create, :edit, :update]
      resources :products, only: [:index, :new, :create, :show, :edit, :update]
      resources :order_products, only: [:update]
      resources :orders, only: [:index, :show, :update, :today]
      resources :main_accounts, only: [:index]
    end

  end
