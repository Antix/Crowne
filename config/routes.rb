Bomb::Application.routes.draw do
  devise_for :owners
  root to: 'businesses#index'

  devise_for :users
  
  resources :businesses, only: [:index]

end
