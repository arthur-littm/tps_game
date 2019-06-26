Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :games, only: [:new, :create]
  end
  resources :games, except: [:new, :create] do
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
