Rails.application.routes.draw do
  get 'users/show_profile'
  get 'stories/show'
  devise_for :users
  get "users/:id", to: "users#show_profile", as: "user"
  root to: "groups#index"

  resources :groups, only: [:index, :show] do
    resources :requests, only: [:create] do
      patch :accepted
      patch :declined
    end
    post "events/:event_id/bookings", to: "groups#create_booking", as: :event_bookings
    resources :chatrooms, only: [:show] do
      resources :messages, only: [:create]
    end
  end

  resources :resources do
    post :pin_unpin, to: "pins#pin_unpin"
  end

  resources :stories, only: [:index]
  get "stories/:id", to: "stories#show_story", as: :story
  post "prompts", to: "stories#create_prompt"
end
