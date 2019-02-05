Rails.application.routes.draw do
  get 'products', to: 'products#index'
  get 'products/new', as: 'new_product'
  post 'products', to: 'products#create'
  get 'products/:id', to: 'products#show', as: 'product'
  resources :products, only: [:destroy]
  root 'products#index'
end

