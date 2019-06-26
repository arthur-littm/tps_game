Rails.application.routes.draw do
  get "join", to: "games#invite", as: :join

  resources :users, only: [:create]

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :answers, only: [] do
    member do
      post 'vote', to: 'answers#vote'
    end
  end
  resources :games, only: [:new, :create, :show] do
    resources :rounds do
      member do
        get 'result'
      end
    end
  end

  resources :rounds, only: [] do
    resources :answers, only: :create
  end
end
