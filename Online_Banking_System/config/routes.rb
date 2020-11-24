Rails.application.routes.draw do
  root 'application#application'
  get '/login', to: 'customersession#new'
  post '/login', to: 'customersession#create'
  delete '/logout', to 'customersession#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
