Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products do
    resources :orders, only: [:new, :create]
  end

  resources :orders, only: :show

  resources :users, only: [:edit, :update, :show, :destroy]

  get 'dashboard', to: 'users#dashboard'
end
