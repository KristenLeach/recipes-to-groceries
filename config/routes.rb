Rails.application.routes.draw do

  root "welcome#index"

  resources :users, only: [:new, :create, :show] do 
    resources :recipes, only: [:new, :create, :edit, :update, :destroy]
    resources :meals, only: [:index, :new, :create, :destroy, :update, :edit]
  end

  resources :recipes, only: [:show] do 
    resources :comments
  end

    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'
    #get '/signup' => 'users#new'
    #post '/signup' => 'users#create'

    get "auth/facebook/callback" =>  'sessions#facebook'
    get "/popular_recipes" => "welcome#popular_recipes"
    get "/favorites" => "welcome#favorite_recipes"
    post '/heart' => 'hearts#heart'
    delete '/unheart' => 'hearts#unheart'


end
