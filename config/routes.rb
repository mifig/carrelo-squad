Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: "admin" }
  
  root "actors#index"

  resources :actors, param: :name do
    resources :links, only: [:index, :create, :update]
    resources :articles, only: [:index, :create, :update]
  end

  resources :links, only: [:destroy]
  resources :articles, only: [:destroy]
  
  resources :messages, only: [:index, :create, :destroy] do
    member do
      patch "read", to: "messages#message_read", as: :read
      patch "unread", to: "messages#message_unread", as: :unread
    end
  end

  get "about", to: "pages#about"
end
