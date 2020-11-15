Rails.application.routes.draw do
  root to: 'buzzs#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit]
  resources :buzzs, only: [:index, :create]
end
