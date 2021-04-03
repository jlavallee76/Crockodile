Rails.application.routes.draw do
  resources :categories
  resources :order_items

  root to: "home#main"

  get "products", to: "products#index"
  get "cart", to: "cart#show"
  get "search", to: "products#search"
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)
  resources :products, only: %i[index show search]
  resources :cart, only: %i[create destroy]

  devise_for :users, controllers: {
    registrations: "registrations"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
