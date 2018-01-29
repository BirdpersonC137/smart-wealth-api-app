Rails.application.routes.draw do
  resources :user_dashboard, only: [:index, :edit, :update, :destroy]
  resources :strategies, only: [:create, :destroy]
  resources :user_accounts, only: [:new, :create, :destroy,:edit, :update]
  resources :accounts, only: [:create, :destroy]
  resources :account_types, only: [:create]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :portfolios do
    get :holdings, on: :member
  end
  devise_for :users, controllers: {:registrations => "registrations"}
  resources :investments
  get '/deposits', to: 'user_dashboard#deposits'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
