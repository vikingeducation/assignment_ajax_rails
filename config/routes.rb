Rails.application.routes.draw do
  root 'static_pages#json_test'

  resources :movies, :reviews

  StaticPagesController.action_methods.each do |action|
    get "/#{action}", to: "static_pages##{action}", as: "#{action}_page"
  end
end
