Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  resources :posts do
    resource :likes, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create, :index, :show, :edit, :update] do
    member do
    get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end
  get "/homes/about" => "homes#about", as: "about"
end
