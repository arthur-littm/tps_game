Rails.application.routes.draw do
  root to: 'pages#home'
  # id will actually by a code
  get "games/:id", to: "games#show", as: :game
  get "join", to: "games#invite", as: :join

  resources :users, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :games do
    member do
      get 'invite'
    end
    resources :rounds do
      member do
        get 'result'
      end
    end
  end
end
