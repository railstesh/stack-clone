# frozen_string_literal: true

Rails.application.routes.draw do
  resources :questions do
    resources :answers
  end
  devise_for :users
  resources :answers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'all_questions', to: 'questions#all_questions'
  root 'questions#all_questions'
end
