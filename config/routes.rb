Rails.application.routes.draw do
  devise_for :users
  
  root to: 'homes#top'
  get "/about", to: "homes#about"
  
  resources :users, only: [:show, :edit, :update]
    # 退会確認画面
    get "/users/:id/unsubscribe", to: "users#unsubscribe", as: 'unsubscribe'
    # 論理削除用のルーティング
    patch "/users/:id/withdraw", to: "users#withdraw", as: 'withdraw'
end
