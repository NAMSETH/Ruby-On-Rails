Rails.application.routes.draw do
  get '/customer/login', to: 'customer_session#new'
  post '/customer/login', to: 'customer_session#create'
  delete '/customer/logout', to: 'customer_session#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
