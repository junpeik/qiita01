Rails.application.routes.draw do
  get 'tags/index'

  get 'tags/show'

  devise_for :users
  resources :users, only: :show do
    resources :items, only: %i(show edit update destroy), controller: 'users/items'
    member do
      get 'private_items'
      get 'comments'
    end
  end
  resources :items, only: %i(index new create) do
    resources :comments, only: %i(create destroy)
    resources :stocks, only: %i(create destroy)
  end
  resources :stocks, only: :index
  resources :tags
  root 'home#index'
end
