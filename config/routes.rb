Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :attorneys
  resources :cases
  resources :clients
  resources :reports
  resources :users
  resources :sessions

  get "signup" => "users#new"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy"

  root "cases#index"
end
 