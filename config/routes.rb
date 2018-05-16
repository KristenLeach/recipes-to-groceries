Rails.application.routes.draw do
  resources :meal_plans
  # Do I need a nested resource to prevent other users from editing recipes? Probably
  root "welcome#index"
  resources :users, only: [:new, :create, :show] do 
    resources :recipes, only: [:new, :edit, :destroy]
  end
  resources :sessions
  resources :recipes, only: [:show, :create]
end
