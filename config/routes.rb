Rails.application.routes.draw do



  devise_for :users
  root 'questions#index'

  resources :questions, shallow: true do
    resources :comments, only: [:create]
    resources :votes, only: [:create, :destroy]

    resources :answers, only: [:create],shallow: true do
      resources :votes, only: [:create, :destroy]
      resources :comments, only: [:create]
    end

  end

  get 'questions/:id/answers', to: 'questions#show'
  get 'questions/:id/comments', to: 'questions#show'
  get 'questions/:id/votes', to: 'questions#show'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
