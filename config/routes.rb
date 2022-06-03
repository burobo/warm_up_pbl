Rails.application.routes.draw do
  get 'ideas/register', 'ideas#register'
  post 'ideas/register' => 'ideas#create'
  get 'ideas/edit/:id' => 'ideas#edit', as: :ideas_edit
  put 'ideas/:id' => 'ideas#update', as: :ideas_update
  get 'ideas/:id' => 'ideas#show', as: :ideas_show
  put 'ideas/:id/favorite' => 'ideas#favorite'
  root to: 'pages#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'pages/detail'
  resources :notifications, only: :index
end
