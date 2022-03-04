Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  default_url_options host: "http://127.0.0.1:3000/"
  
  resources :attorneys
  resources :cases
  resources :clients
  resources :reports
  resources :users

  resources :users, param: :confirm_token do
    member do
      get :confirm_email
    end
  end

  resources :sessions

  get "signup" => "users#new"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy"

  root "sessions#new"
end
 