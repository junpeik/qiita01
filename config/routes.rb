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
  resources :items
  #controllerオプションを使うusers/items
  root 'home#index'
end
