FacebookLite::Application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :profiles, only: [:new, :edit, :create, :update]
end
