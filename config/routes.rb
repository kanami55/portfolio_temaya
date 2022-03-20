Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admins/sessions"
}

  devise_for :users

  #admin側
  namespace :admins do
    root to: "homes#index"
    resources :posts, only: [:index, :show, :destroy]
  end

  #user側
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
  get "/search" => "searches#search"
  resources :chats, only: [:create, :show]
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

end
