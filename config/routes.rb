Rails.application.routes.draw do
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

  resources :games, only: [:create] do
    post "prompts", to: "games#create_prompt"
    get "story", to: "games#story"
  end
  get "games", to: "games#new_game"
  get "/games/:id", to: "games#show", as: "game"

  resources :stories, only: [:show]

end
