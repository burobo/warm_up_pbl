Rails.application.routes.draw do
  get 'ideas/register', 'ideas#register'
  post 'ideas/register' => 'ideas#create'
  get 'ideas/:id' => 'ideas#show'
  put 'ideas/:id/favorite' => 'ideas#favorite'
  root to: 'pages#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'pages/detail'
end
