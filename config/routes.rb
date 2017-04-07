Rails.application.routes.draw do
  resources :movies, only: [:index, :create]

  root 'movies#index'
end
