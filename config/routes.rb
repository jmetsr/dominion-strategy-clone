DominionStrategyClone::Application.routes.draw do
  root to: 'static_pages#root'
  resources :users
  resource :session
  resources :replies, only: [:show, :edit, :update, :destroy]
  resources :boards do
    resources :topics, only: [:new, :create]
  end
  resources :topics, only: [:show, :edit, :update, :destroy] do
    resources :replies, only: [:new, :create]
  end
  namespace :api, defaults: { format: :json } do
    resources :users
    resources :replies, only: [:show, :edit, :update, :destroy]
    resources :boards do
      resources :topics, only: [:new, :create]
    end
    resources :topics, only: [:show, :edit, :update, :destroy, :index, :create] do
      resources :replies, only: [:new, :create, :edit]
    end
    resources :replies
  end
end
