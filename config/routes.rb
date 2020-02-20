Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'users/new', to: "users#create"
  get '/user', to: 'users#show'
  patch '/user', to: 'users#update'
  delete '/user', to: 'users#delete'
  post 'teams/new', to: 'teams#create'
  get '/team/:id', to: 'teams#show'
  delete '/team/:id', to: 'teams#delete'
  post '/characters/new', to: 'characters#create'
  delete '/character/:id', to: 'characters#delete'
  get '/start/:id', to: 'single_player#start'
end
