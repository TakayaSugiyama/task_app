Rails.application.routes.draw do
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  root "tasks#index"
  resources :tasks, except: :index

  namespace :admin do  
    resources :users
  end
end
