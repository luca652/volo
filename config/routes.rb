Rails.application.routes.draw do

  # get 'stories/show'
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

  resources :stories, only: [:new, :show]
  post "prompts", to: "stories#create_prompt"
end
