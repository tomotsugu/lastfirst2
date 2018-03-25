Rails.application.routes.draw do
  get 'admintops/index'

  get 'sessions/new'
  root to: "top#index"
  resources :sessions, only: [:new, :create, :destroy]
  resources :aboutus, only: [:index]
  resources :policy, only: [:index]
  resources :first, only: [:index]
  resources :admintops, only: [:index]

  resources :posts

  get 'contacts/complete', to: 'contacts#complete', as: 'complete_contacts'
  resources :contacts do
    collection do
      post :confirm
    end
  end
  
  get 'request/:id', to: 'requests#new', as: 'request_new'
  get 'requests/complete', to: 'requests#complete', as: 'complete_requests'
  resources :requests do
    collection do
      post :confirm
    end
  end
  resources :users

  get 'informations/admin', to: 'informations#index_admin'
  get 'informations/visitor', to: 'informations#index_visitor'
  resources :informations do
    collection do
      post :confirm
    end
  end
end
