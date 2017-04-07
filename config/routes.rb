Rails.application.routes.draw do
  resources :movies, only: [:index]

  root 'movies#index'
end
