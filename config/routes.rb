Rails.application.routes.draw do
  get 'timeline/index'
  devise_for :users
  
  root to: 'homes#top'
  get "/about", to: "homes#about"
  
  # 退会確認画面
  get "/users/:id/unsubscribe", to: "users#unsubscribe", as: 'unsubscribe'
  # 論理削除用のルーティング
  patch "/users/:id/withdraw", to: "users#withdraw", as: 'withdraw'
  resources :users, only: [:show, :edit, :update, :index] do
    resources :posts, only: [:index]
    resource :relationships, only:[:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  post "posts/new", to: "posts#create"
  patch "posts/:id/edit", to: "posts#update"
  resources :posts, only: [:new, :create, :index, :show, :edit, :destroy] do
    resources :bookmarks, only: [:create, :destroy]
  end
  
  resources :notifications, only: [:index]
  delete 'notifications/destroy_all', to: 'notifications#destroy_all', as: 'destroy_all_notifications'
  
  # タグの検索で使用する
  get "search_tag"=>"posts#search_tag"

  get 'search', to: 'searches#search'

  get '/timeline', to: 'timeline#index'

end
