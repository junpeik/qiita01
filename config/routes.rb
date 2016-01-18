Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show do
    resources :items
    member do
      get 'stock'
      get 'private'
      get 'comments'
    end
  end
  resources :items, only: :index
  root 'home#index'
end
