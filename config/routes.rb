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
  # 退会確認画面
  get '/users/:id/unsubscribe', to: 'users#unsubscribe', as: 'unsubscribe'
  # 論理削除用のルーティング
  patch '/users/:id/withdrawal', to: 'users#withdrawal', as: 'withdrawal'
  #DM機能
  resources :chats, only: [:create, :show]
  #ゲストログイン機能
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  #検索機能
  get "/search", to: "searches#search"
end
