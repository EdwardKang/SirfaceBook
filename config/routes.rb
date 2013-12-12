FacebookLite::Application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :profiles, only: [:new, :edit, :create, :update]
  root :to => 'home_pages#root'
end
