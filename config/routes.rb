Rails.application.routes.draw do
 
  root "welcome#index"

  resources :users, only: [:new, :create, :show] do 
    resources :recipes, only: [:new, :create, :edit, :destroy]
    resources :meals, only: [:index, :new, :create, :destroy]
  end

  resources :recipes, only: [:show]

    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'
    #get '/signup' => 'users#new'
    #post '/signup' => 'users#create'
  
end
