Rails.application.routes.draw do
  # Do I need a nested resource to prevent other users from editing recipes? Probably
  root "welcome#index"
  resources :users, only: [:new, :create, :show]
  resources :sessions
  resources :recipes 
end
