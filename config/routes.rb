Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :products, only: [:index, :new, :create, :show, :featured] do
    resources :reviews, only: [:create, :show]
    resources :renting_requests, only: :create
  end

  resources :renting_requests, only: [:index, :update]

  # namespace :owner do
  #   resources :renting_requests, only: [:index, :update]
  # end
end
