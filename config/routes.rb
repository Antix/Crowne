Bomb::Application.routes.draw do
  devise_for :admins
  root to: 'businesses#index'

  devise_for :users, controllers: {registrations: "users/registrations", omniauth_callbacks: "users/omniauth_callbacks"}
  devise_for :owners, controllers: {registrations: "owners/registrations"}
  
  resources :businesses

end
