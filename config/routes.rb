Rails.application.routes.draw do
  root to: 'static_pages#home'
  resources :users
  get '/secret', to: 'users#secret'
  get '/answer', to: 'static_pages#answer'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
