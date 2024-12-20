Rails.application.routes.draw do
  root "toys#index"
  get "/signup",    to: "users#new"
  post "/signup",   to: "users#create"
  get "/login",     to: "sessions#new"
  post "/login",    to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, only: [:show] do
    resource :review, only: [:create, :edit, :update, :destroy]
  end
  resources :account_activations, only: [:edit]
  resources :toys
  resources :tags, only: [:create]
end
