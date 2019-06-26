Rails.application.routes.draw do
  get "join", to: "games#invite", as: :join

  resources :users, only: [:create]

  root to: 'games#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :games, except: [:new, :create] do
    resources :rounds do
      member do
        get 'result'
      end
    end
  end
end
