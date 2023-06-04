Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :groups, only: [:index, :show] do
    resources :requests, only: [:create]
    post "events/:id/booking", to: "bookings#create"
    resources :chatrooms, only: [:show] do
      resources :messages, only: [:create]
    end
  end
  resources :resources, only: [:index, :show] do
    resources :pins, only: [:create]
  end
  resources :pins, only: [:index, :destroy]


end
