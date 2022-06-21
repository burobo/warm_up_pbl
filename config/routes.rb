Rails.application.routes.draw do
  get 'about' => 'static_pages#about', as: :about
  get 'ideas/register', 'ideas#register'
  post 'ideas/register' => 'ideas#create'
  get 'ideas/edit/:id' => 'ideas#edit', as: :ideas_edit
  put 'ideas/:id' => 'ideas#update', as: :ideas_update
  resources :ideas, only: [:show], as: :ideas_show do
    resources :comments, only: [:create]
  end
  put 'ideas/:id/favorite' => 'ideas#favorite'
  root to: 'pages#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'pages/detail'
  resources :notifications, only: [:index, :update]
end
