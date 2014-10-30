DominionStrategyClone::Application.routes.draw do
  resources :users
  resource :session
 # resources :topics, only: [:show, :edit, :update, :destroy]
#  resources :replies, only: [:show, :edit, :update, :destroy]

#  resources :boards do
 #   resources :topics, only: [:new, :create]
#  end

 # resources :topics do
  #  resources :replies, only: [:new, :create]
#  end

  resources :boards do
    resources :topics do
      resources :replies
    end
  end

end
