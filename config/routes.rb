Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: "admin" }
  root "actors#index"

  resources :actors, param: :name do
    resources :links, only: [:create, :destroy, :update]
    get "links", to: "links#new"
  end
  
  get "about", to: "pages#about"
end
