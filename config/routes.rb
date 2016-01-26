Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show do
    resources :items, only: %i(show edit update destroy), controller: 'users/items'
    member do
      get 'stock'
      get 'private'
      get 'comments'
    end
  end
  resources :items, only: %i(index new create) do
    resources :comments, only: %i(create destroy)
  end
  root 'home#index'
end
