Rails.application.routes.draw do
  resources :users, only: [:new,:show,:create]
  root "tasks#index"
  resources :tasks, except: :index
end
