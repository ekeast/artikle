Rails.application.routes.draw do
  resources :articles do
    resources :ratings, only: [:create, :update, :destroy]
  end

  root to: "welcome#index"
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/my_articles', to: 'sessions#show'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
