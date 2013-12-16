Korning::Application.routes.draw do

  resources :employees, only: [:index, :show]
  resources :customers, only: :index
  resources :products, only: :index
  resources :sales

end
