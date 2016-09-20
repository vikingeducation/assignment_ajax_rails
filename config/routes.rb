Rails.application.routes.draw do
  root "movies#index"
  resources :movies, only: [:index, :create]
  resources :reviews, only: [:index, :create, :destroy]
end
