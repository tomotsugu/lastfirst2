Rails.application.routes.draw do
  get 'admintops/index'

  get 'sessions/new'
  root to: "top#index"
  resources :sessions, only: [:new, :create, :destroy]
  resources :admintops, only: [:index]
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
