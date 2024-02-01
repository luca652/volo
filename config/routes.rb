Rails.application.routes.draw do

  devise_for :users
  get "users/:id", to: "users#show_profile", as: "user"

  root to: "users#show_profile"

  resources :groups do
    resources :requests, only: [:create] do
      patch :accepted
      patch :declined
    end
    resources :events do
      resources :bookings, only: [:create, :destroy]
    end
    resources :chatrooms, only: [:show] do
      resources :messages, only: [:create]
    end
  end

  resources :resources do
    post :pin_unpin, to: "pins#pin_unpin"
  end

  post "prompts", to: "prompts#create"
  resources :stories, only: [:new, :create, :show]
end
