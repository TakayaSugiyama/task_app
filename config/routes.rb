Rails.application.routes.draw do
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  root "tasks#index"
  resources :tasks, except: :index
  namespace :admin do  
    resources :users
    patch "remove/:id" ,to: "users#remove" , as: "remove"
    patch "add/:id" ,to: "users#add" , as: "add"
  end
end
