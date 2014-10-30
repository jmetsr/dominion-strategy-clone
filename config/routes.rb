DominionStrategyClone::Application.routes.draw do
  resources :users
  resource :session

  resources :replies, only: [:show, :edit, :update, :destroy]

  resources :boards do
    resources :topics, only: [:new, :create]
  end

  resources :topics, only: [:show, :edit, :update, :destroy] do
    resources :replies, only: [:new, :create]
  end


end
