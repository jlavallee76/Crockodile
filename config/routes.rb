Rails.application.routes.draw do
  resources :categories
  root to: "home#main"
  get "/products" => "products#index"

  get "order_item/create"
  get "order_item/update"
  get "order_item/destroy"
  get "cart/show"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products, only: %i[index show]
  resources :cart, only: %i[create destroy]

  devise_for :users, controllers: {
    registrations: "registrations"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
