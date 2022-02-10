Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :attorneys
  resources :cases
  resources :clients
  resources :reports
  resources :users

  get "signup" => "users#new"
  root "cases#index"
end
 