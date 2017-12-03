Rails.application.routes.draw do

  resources :strategies
  resources :user_accounts
  resources :accounts
  resources :account_types, only: [:create]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :portfolios
  devise_for :users
  resources :investments
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
