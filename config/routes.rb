DominionStrategyClone::Application.routes.draw do
  resources :users
  resource :session
  resources :topics do
    resources :subjects do
      resources :replies
    end
  end
end
