Rails.application.routes.draw do
  root "toys#index"
  get "/signup",    to: "users#new"
  post "/signup",   to: "users#create"
  get "/login",     to: "sessions#new"
  post "/login",    to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, only: [:show]
  resources :account_activations, only: [:edit]
  resources :toys
end
