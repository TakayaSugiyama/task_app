Rails.application.routes.draw do
  root "tasks#index"
  post "/" ,to: "tasks#index"
  resources :tasks, except: :index
end
