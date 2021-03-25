Rails.application.routes.draw do
  resources :products

  devise_for :users, controllers: {
    registrations: "registrations"
  }

  root to: "home#main"
  get "/products" => "products#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
