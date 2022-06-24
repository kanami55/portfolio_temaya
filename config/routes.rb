Rails.application.routes.draw do
  get 'hello_vue/index'
  devise_for :users
  resources :users, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end

  root to: 'homes#top'

  # 管理者画面
  namespace :admin do
    resources :users, only: [:index, :destroy]
  end
  resources :posts do
    resource :likes, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  # ゲストログイン機能
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  # DM機能
  resources :chats, only: [:create, :show]
  #通知機能
  resources :notifications, only: [:index]
  # 検索機能
  get "/search", to: "searches#search"
  # 退会確認画面
  get '/users/:id/unsubscribe', to: 'users#unsubscribe', as: 'unsubscribe'
  # 論理削除用のルーティング
  patch '/users/:id/withdrawal', to: 'users#withdrawal', as: 'withdrawal'
end
