Bomb::Application.routes.draw do
  
  root to: 'businesses#index'

  devise_for :users, controllers: {registrations: "users/registrations", omniauth_callbacks: "users/omniauth_callbacks"}
  devise_for :owners, controllers: {registrations: "owners/registrations"}
  devise_for :admins, controllers: {registrations: "admins/registrations"}
  
  resources :businesses

end
