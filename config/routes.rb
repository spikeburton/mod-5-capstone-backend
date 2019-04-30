Rails.application.routes.draw do
  post '/login', to: 'auth#login', as: :login
  get '/profile', to: 'users#profile', as: :profile
  patch '/settings', to: 'users#settings', as: :settings
  delete '/purge', to: 'users#purge', as: :purge

  resources :favorites
  resources :drives
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
