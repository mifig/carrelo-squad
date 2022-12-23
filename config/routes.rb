Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: "admin" }
  root "actors#index"

  resources :actors, param: :name
  get "about", to: "pages#about"
end
