Rails.application.routes.draw do
  get 'post_comments/create'
  get 'post_comments/destroy'
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users
  root to: 'homes#top'

  resources :posts do
    resource :likes, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create, :index, :show, :edit, :update]
  get "/homes/about" => "homes#about", as: "about"
end
