Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products, only: %i[index show]
  resources :cart, only: %i[create destroy]

  devise_for :users, controllers: {
    registrations: "registrations"
  }

  root to: "home#main"
  get "/products" => "products#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
