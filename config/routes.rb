Rails.application.routes.draw do

  get 'users/show'

  root 'home#index'

  get '/auth/twitter', as: '/login'
  get '/auth/twitter/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/users/:id', as: :user, to: 'users#show'

  post '/tweet', to: 'users#tweet'
  post '/favorite/:favorite', to: 'users#favorite'
  post '/reply/:tweet_reply/:tweet_id', to: 'users#tweet_reply'
end
