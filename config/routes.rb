Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :planets, only: [:index, :show, :new, :create]
  resources :spaceships, only: [:index, :show]
  resources :bookings, except: :destroy
  delete "bookings/:id", to: "bookings#destroy", as: "destroy_booking"
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
