Rails.application.routes.draw do
  get 'stories/show'
  devise_for :users
  root to: "pages#home"
  get "profile", to: "pages#profile"

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

  resources :resources, only: [:index, :show] do
    resources :pins, only: [:create]
  end
  resources :pins, only: [:index, :destroy]

  resources :stories, only: [:index]
  get "stories/:id", to: "stories#show_story", as: :story
  post "prompts", to: "stories#create_prompt"
end
