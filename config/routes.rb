Rails.application.routes.draw do
  root to: 'buzzs#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :buzzs, only: [:index, :create]
  resources :followings, only: [:create, :destroy]
end
