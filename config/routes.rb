Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :groups, only: [:index, :show] do
    post "groups/:id/request", to: "requests#create"
    post "groups/:id/events/:id/booking", to: "bookings#create"
    resources :chatrooms, only: [:show] do
      resources :messages, only: [:create]
    end
  end
  resources :resources, only: [:show] do
    resources :pins, only: [:create]
  end
end
