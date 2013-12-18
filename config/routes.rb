FacebookLite::Application.routes.draw do
  resources :users, only: [:new, :create, :show, :index] do
    member do
      get "wall"
      get "photos"
      get "about"
      get "friends"
    end
  end
  resource :session, only: [:new, :create, :destroy]
  resources :profiles, only: [:new, :edit, :create, :update]
  root :to => 'home_pages#root'
  get "/friend-requests", to: 'home_pages#friend_req'
  get "/notifications", to: 'home_pages#notifications'


  resources :posts, only: [:create, :update, :destroy] do
    resources :comments, only: [:new, :create, :destroy]
  end

  resources :comments, only: [:edit, :update, :destroy]
  resources :friendships, only: [:create, :update, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :messages, only: [:create, :index, :show]
  resources :photos, only: [:show, :update]
end
