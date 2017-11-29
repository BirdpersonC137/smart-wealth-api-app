Rails.application.routes.draw do
  resources :survey_answers
  resources :survey_questions
  resources :risk_assessments
  get 'questions/destroy'

  # resources :choices, only: [:destroy]
  # resources :questions, only: [:destroy]
  # resources :surveys do
  #   # end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :portfolios
  devise_for :users
  resources :investments
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
