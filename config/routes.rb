PackPickup::Application.routes.draw do
  root to: 'sessions#new' 

  #create a named route called register automatically
  #CRUD is not applicable so resource is not an appropriate choice,
  #instead manually build routes 
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :residents do   
    resources :packages do 
      member do # will build 'POST /posts/id' part of route
        post :new
      end
    end
  end

  resources :apartments, only: [:index, :edit, :update] 
end
