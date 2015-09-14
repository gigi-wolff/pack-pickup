PackPickup::Application.routes.draw do
  root to: 'residents#index'

  resources :residents do   
    resources :packages
  end

  resources :apartments, only: [:index, :edit, :update] 
end
