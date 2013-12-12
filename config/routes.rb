FacebookLite::Application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :profiles, only: [:new, :edit, :create, :update]
  root :to => 'home_pages#root'

  resources :posts, only: [:new, :create, :edit, :update, :destroy] do
    resources :comments, only: [:new, :create]
  end

  resources :comments, only: [:edit, :update, :destroy]
end
