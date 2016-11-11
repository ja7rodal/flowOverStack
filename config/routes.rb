Rails.application.routes.draw do

  devise_for :users
  root 'questions#index'
  resources :questions do
    resource :answers, only: [:create] do
      resources :comments, only: [:create]
    end

    esources :comments, only: [:create]
      
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
