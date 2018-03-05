Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#new'

  # Facebook
  get '/auth/facebook/callback' => 'sessions#create_facebook'

  # Landing page
  get '/welcome' => 'portfolios#welcome'

  # Models
  resources :users, only: [:create] do
    resources :portfolios, shallow: true do
      resources :coin_portfolios, shallow: true
    end
  end

  scope :users do
    get '/top-portfolios' => 'users#top_portfolios'
  end

  # Login/logout
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

end
