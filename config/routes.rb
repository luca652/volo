Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "profile", to: "pages#profile"

  resources :groups, only: [:index, :show] do
    resources :requests, only: [:create]
    post "events/:event_id/bookings", to: "groups#create_booking", as: :event_bookings
    patch "requests/:request_id/accepted", to: "pages#accepted", as: :request_accepted
    patch "requests/:request_id/declined", to: "pages#declined", as: :request_declined
    resources :chatrooms, only: [:show] do
      resources :messages, only: [:create]
    end
  end

  resources :resources, only: [:index, :show] do
    resources :pins, only: [:create]
  end

  resources :pins, only: [:index, :destroy]
end
