Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: "admin" }, skip: [:registrations]

  as :user do
    get 'users/edit' => 'devise/registrations#edit', as: 'edit_user_registration'
    patch'users/:id' => 'devise/registrations#update', as: 'user_registration'
  end
  
  root "actors#index"
  post "/en", to: "locales#set_en"
  post "/pt", to: "locales#set_pt"

  resources :actors, param: :name do
    resources :links, only: [:index, :create, :update]
    resources :articles, only: [:index, :create, :update]
    delete :delete_photo
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
