Rails.application.routes.draw do

  get 'admin_users/new'
  get 'admin_user/new'
  root 'customer_session#new'

  get '/customer/login', to: 'customer_session#new'
  post '/customer/login', to: 'customer_session#create'
  delete '/customer/logout', to: 'customer_session#destroy'

  get '/admin/login', to: 'admin_sessions#new'
  post '/admin/login', to: 'admin_sessions#create'
  delete '/admin/logout', to: 'admin_sessions#destroy'

  get 'transactions/payment_error'

  get 'transactions/new'
  post 'transactions/create'

  resources :admin_users do
    member do
      get :delete
    end
  end
  resources :customers do
    member do
      get :delete
    end
  end
  resources :accounts do
    member do
      get :delete
    end
  end

  resources :transactions


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
