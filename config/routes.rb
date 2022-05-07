Rails.application.routes.draw do
  get 'ideas/register', 'ideas#register'
  post 'ideas/register' => 'ideas#create', :as => :idea_create
  resources :ideas
  root to: 'pages#index'
  devise_for :users
  get 'pages/detail'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
