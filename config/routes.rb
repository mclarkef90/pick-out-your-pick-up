Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/', to: 'application#home', as: 'home'
  get '/users/owner_home', to: 'users#owner_home', as: 'owner_home'
  get '/restaurant_reviews', to: 'restaurant_reviews#home', as: 'restaurant_reviews_home'

  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'

  delete '/signout', to: 'sessions#destroy', as: 'signout'

  get '/auth/:provider/callback', to: 'sessions#omniauth'

  resources :genres

  resources :carts
  resources :take_out_orders

  resources :menu_item_reviews, only: [:index, :edit, :update, :destroy]


  resources :restaurant_reviews, only: [:edit, :update, :destroy]


  resources :menu_items, only: [:index, :show, :edit, :update, :destroy] do
    resources :menu_item_reviews, only: [:index, :new, :create, :show]
  end

  resources :menus, only: [:index, :edit, :update, :destroy] do
    resources :menu_items, only: [:new, :create, :show]
  end

  resources :restaurants do
    resources :menus, only: [:new, :create, :show]
    resources :restaurant_reviews, only: [:index, :new, :create, :show]
  end

  resources :users do
    resources :restaurant_reviews, only: [:index]
    resources :menu_item_reviews, only: [:index]
  end



end
