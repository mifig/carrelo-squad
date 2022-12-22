Rails.application.routes.draw do
  devise_for :users
  root "actors#index"

  resources :actors, param: :name
  get "about", to: "pages#about"
end
