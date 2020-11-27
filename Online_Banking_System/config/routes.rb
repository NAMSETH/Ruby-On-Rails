Rails.application.routes.draw do
  root 'customers#index'
  # get 'customers/index'
  # get 'customers/show'
  # get 'customers/new'
  # get 'customers/create'
  # get 'customers/update'
  # get 'customers/edit'
  # get 'customers/delete'
  # get 'customers/destroy'

  resources :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
