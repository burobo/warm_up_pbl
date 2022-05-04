Rails.application.routes.draw do
  resources :ideas
  root to: 'pages#index'
  devise_for :users
  get 'pages/detail'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
