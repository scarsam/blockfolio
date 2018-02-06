Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#new'

  #sign up
  resources :users, only: [:create]

  #facebook
  get '/auth/facebook/callback' => 'sessions#create_facebook'

  #login/logout
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :portfolios do
    resources :coin_portfolios
  end

end
