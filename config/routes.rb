Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :products, only: [:index, :new, :create] do
    resources :reviews, only: :create
    resources :renting_requests, only: :create
  end

  resources :renting_requests, only: :index

  namespace :owner do
    resources :renting_requests, only: [:index, :update]
  end
end
