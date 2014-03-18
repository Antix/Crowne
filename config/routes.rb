Bomb::Application.routes.draw do
  root to: 'businesses#index'

  devise_for :users
  
  resources :businesses, only: [:index]

end
