Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/authenticate', to: 'authentication#authenticate'
  post 'users/new', to: "users#create"
  get '/user', to: 'users#show'
  patch '/user', to: 'users#update'
  delete '/user', to: 'users#delete'
  post 'teams/new', to: 'teams#create'
  get '/team/:id', to: 'teams#show'
  delete '/team/:id', to: 'teams#delete'
  post '/characters/new', to: 'characters#create'
  delete '/character/:id', to: 'characters#delete'
  get '/dungeons', to: 'dungeons#index'
  post '/floor', to: 'floors#create'
  post '/attack', to: 'single_player#attack'
  post '/hit', to: 'single_player#hit'
  get '/attacks', to: 'attacks#index'
  post '/heal', to: 'single_player#health'
  post '/save', to: 'saves#create'
  post '/load', to: 'saves#show'
end
