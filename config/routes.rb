Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  resources :posts
  resources :users, only: [:new, :create, :index, :show, :edit, :update]
  get "/homes/about" => "homes#about", as: "about"
end
