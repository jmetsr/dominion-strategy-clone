DominionStrategyClone::Application.routes.draw do
  resources :users
  resource :session
  resources :topics
end
