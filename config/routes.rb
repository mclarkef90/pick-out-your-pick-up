Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/', to: 'application#home', as: 'home'

  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'

  delete '/signout', to: 'sessions#destroy', as: 'signout'

  get '/auth/:provider/callback', to: 'sessions#omniauth'

  resources :users

end
