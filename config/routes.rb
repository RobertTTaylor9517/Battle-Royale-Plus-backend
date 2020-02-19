Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'users/new', to: "users#create"
  get '/user', to: 'users#show'
  patch '/user', to: 'users#update'
  delete '/user', to: 'users#delete'
end
