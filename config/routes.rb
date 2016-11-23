Rails.application.routes.draw do

  get 'comments/index'

  get 'comments/create'

  devise_for :users
  root 'questions#index'
  resources :questions do
    resource :answers, only: [:create] do
      resources :comments, only: [:create]
    end

    resources :comments, only: [:create]

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
