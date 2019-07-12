Rails.application.routes.draw do
  root to: 'groups#index'

  resources :groups

  resources :uploads, only: [:new, :create]
end
