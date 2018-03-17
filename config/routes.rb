Rails.application.routes.draw do
  get 'sessions/new'
  root to: "top#index"
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts
  resources :contacts do
    collection do
      post :confirm
    end
  end
  resources :users
  resources :informations do
    collection do
      post :confirm
    end
  end
end
