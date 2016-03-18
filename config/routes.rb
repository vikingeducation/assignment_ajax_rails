Rails.application.routes.draw do
  resources :movies
  resources :reviews

  root to: 'movies#index'
end
