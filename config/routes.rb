Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :groups, only: [:index, :show] do
    resources :requests, only: [:create]
    post "events/:event_id/bookings", to: "groups#create_booking", as: :event_bookings
    get "events/:event_id/bookings/bookings_id/accepted"
    get "events/:event_id/bookings/bookings_id/declined"
    resources :chatrooms, only: [:show] do
      resources :messages, only: [:create]
    end
  end
  resources :resources, only: [:index, :show] do
    resources :pins, only: [:create]
  end
end
