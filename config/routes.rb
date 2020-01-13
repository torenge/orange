  Rails.application.routes.draw do

  root 'public/products#index'
  get 'public/products/genreshow/:id' => "public/products#genreshow", as: "public_products_genreshow"
  delete 'public/carts' => "public/carts#delete_all"
  get 'public/users/:id/withdraw' => 'public/users#withdraw', as: 'withdraw_public_user'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  namespace :public do
    resources :users, only: [:index, :edit, :show, :update]
    resources :deli_addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :carts, only: [:index, :create, :update, :destroy, :destroy_all]
    resources :products, only: [:index, :genreshow, :show, :create]
    resources :order_products, only: [:index, :edit, :show, :update, :create]
    resources :orders, only: [:index, :show]
  end

    namespace :public do
      resources :users, only: [:index, :edit, :show, :update, :withdraw, :destroy]
      resources :deli_addresses, only: [:index, :create, :edit, :update, :destroy]
      resources :carts, only: [:index, :create, :update, :destroy]
      resources :products, only: [:index, :show]
      resources :order_products, only: [:index, :new,  :create, :show, :update]
      resources :orders, only: [:index, :show]
    end


    namespace :admin do
      resources :users, only: [:index, :edit, :show, :update]
      resources :genres, only: [:index, :create, :edit, :update]
      resources :products, only: [:index, :new, :create, :show, :edit, :update]
      resources :order_products, only: [:update]
      resources :orders, only: [:index, :show, :update]
      resources :main_accounts, only: [:index]
    end

  end
