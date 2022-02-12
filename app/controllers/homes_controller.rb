class HomesController < ApplicationController
  
  # トップ画面
  def top
    @posts = Post.all.order(created_at: :desc)
  end
  
  # アバウトページ
  def about
  end
end
