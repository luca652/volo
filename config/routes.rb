Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :groups, only: [:index, :show] do
    resources :requests, only: [:create]
    post "events/:event_id/bookings", to: "groups#create_booking", as: :event_bookings

    resources :chatrooms, only: [:show] do
      resources :messages, only: [:create]
    end
  end

  resources :resources, only: [:index, :show] do
    resources :pins, only: [:create]
  end

  resources :pins, only: [:index, :destroy]
end


 # get "events/:event_id/bookings/bookings_id/accepted"
    # get "events/:event_id/bookings/bookings_id/declined"
