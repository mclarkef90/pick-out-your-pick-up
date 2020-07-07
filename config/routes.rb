Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

 #Application & Sessions
  get '/', to: 'application#home', as: 'home'

  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'

  delete '/signout', to: 'sessions#destroy', as: 'signout'

  get '/auth/:provider/callback', to: 'sessions#omniauth'

  ##User Custom Pages
  get '/users/owner_home', to: 'users#owner_home', as: 'owner_home'
  get '/users/reviews', to: 'users#reviews', as: 'reviews_home'

  ##Restaurant Custom Page
  get '/restaurant_reviews/home', to: 'restaurant_reviews#home', as: 'restaurant_reviews_home'

  resources :users

  resources :restaurants do
    resources :menus, only: [:new, :create, :show]
    resources :restaurant_reviews, only: [:index, :new, :create]
  end

  resources :menu_items, only: [:edit, :update, :destroy] do
    resources :menu_item_reviews, only: [:index, :new, :create, :show]
  end

  resources :menus, only: [:edit, :update, :destroy] do
    resources :menu_items, only: [:new, :create]
  end

  resources :restaurant_reviews, only: [:edit, :update, :destroy]

  resources :menu_item_reviews, only: [:edit, :update, :destroy]

end
