Bomb::Application.routes.draw do
  root to: 'businesses#index'

  devise_for :users, controllers: {registrations: "users/registrations"}
  devise_for :owners, controllers: {registrations: "owners/registrations"}
  
  resources :businesses

end
