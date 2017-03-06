Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "reviews#index"
  resources :movies, :only => [:index, :create]
  resources :reviews, :only => [:index, :create, :destroy]
end
