Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#new'

  #sign up
  resources :users, only: [:create]

  #login/logout
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :portfolios
end
