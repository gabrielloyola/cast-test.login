Rails.application.routes.draw do
  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  post 'logout', to: 'session#destroy'

  get 'cast', to: 'cast#index'

  root 'cast#index'
end
