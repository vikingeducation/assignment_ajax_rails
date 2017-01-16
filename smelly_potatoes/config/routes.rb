Rails.application.routes.draw do
  resources :movies, only: [:index, :create, :destroy]

  root "movies#index"
end
