Rails.application.routes.draw do
  root to: 'pages#home'
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
