Rails.application.routes.draw do

  get '/customer/login', to: 'customer_session#new'
  post '/customer/login', to: 'customer_session#create'
  delete '/customer/logout', to: 'customer_session#destroy'


  root 'customer_session#new'
  get 'payments/new'
  post 'payments/create'
  # get 'customers/index'
  # get 'customers/show'
  # get 'customers/new'
  # get 'customers/create'
  # get 'customers/update'
  # get 'customers/edit'
  # get 'customers/delete'
  # get 'customers/destroy' 1 conflict

  resources :customers

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
