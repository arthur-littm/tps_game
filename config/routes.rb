Rails.application.routes.draw do
  get "join", to: "games#invite", as: :join

  resources :users, only: [:create]

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :games, only: [:new, :create, :show] do
    resources :rounds do
      member do
        get 'result'
      end
    end
  end
end
