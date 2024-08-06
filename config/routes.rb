Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "restaurants#index"
  resources :restaurants, only: [:show, :new, :index, :create] do
    resources :reviews, only: [:create]
  end
  resources :reviews, only: [:destroy]
end
