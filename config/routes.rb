Rails.application.routes.draw do
  resources :movies, only: [:index, :create]
  resources :reviews, only: [:index, :create, :delete]

  root 'movies#index'
end
