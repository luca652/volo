Rails.application.routes.draw do
  get 'events/new'
  get 'events/create'
  get 'events/edit'
  get 'events/update'
  get 'events/destroy'
  get 'events/show'
  get 'events/index'

  get 'stories/show'
  devise_for :users
  get "users/:id", to: "users#show_profile", as: "user"

  root to: "groups#index"

  resources :groups do
    resources :requests, only: [:create] do
      patch :accepted
      patch :declined
    end
    resources :events do
      resources :bookings, only: [:create, :destroy]
    end
    # post "events/:event_id/bookings", to: "bookings#create", as: :event_bookings
    resources :chatrooms, only: [:show] do
      resources :messages, only: [:create]
    end
  end
  # delete "events/:event_id/bookings/:id", to: "bookings#destroy", as: :bookings_destroy

  resources :resources do
    post :pin_unpin, to: "pins#pin_unpin"
  end

  resources :stories, only: [:index]
  get "stories/:id", to: "stories#show_story", as: :story
  post "prompts", to: "stories#create_prompt"
end
