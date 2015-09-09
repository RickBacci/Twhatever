Rails.application.routes.draw do

  root 'home#index'

  get '/auth/twitter', as: '/login'
  get '/auth/twitter/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
