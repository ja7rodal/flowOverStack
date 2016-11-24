Rails.application.routes.draw do

  devise_for :users
  root 'questions#index'

  resources :questions do
    resources :comments, only: [:create], module: :questions

    resources :answers, only: [:create]
      #resources :comments, only: [:create], module: :answers
    resources :votes, only: [:create, :destroy], module: :questions
  end

  resources :answers, only: [:create] do
    resources :comments, only: [:create], module: :answers
    resources :votes, only: [:create, :destroy], module: :answers

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
