Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: "registrations", sessions: "sessions" },
    path_names: { sign_in: "login", sign_out: "logout", sign_up: "signup" } 

  resources :users, only: [:index, :show, :edit] do
    resources :reservations, except: [:index]
  end

  resources :addresses
  resources :reservations, only: [:index]

  

  root to: "static_pages#home"

  get '/trucks', to: 'static_pages#trucks', as: "trucks"
  get '/plows', to: 'static_pages#plows', as: "snow_plows"
  get '/about', to: 'static_pages#about', as: "about"
end
