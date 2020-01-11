Rails.application.routes.draw do

  root 'public/users#index'
  get 'public/products/genreshow' => "publicproducts#genreshow"


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }


  namespace :public do
    resources :users, only: [:index, :edit, :show, :update]
    resources :deli_addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :carts, only: [:index, :create, :update, :destroy]
    resources :products, only: [:genreshow, :show, :create]
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
