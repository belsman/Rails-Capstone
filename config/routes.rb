Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :edit]
  resources :buzzs, only: [:index, :create]
end
