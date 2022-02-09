class HomesController < ApplicationController
  def top
    @posts = Post.all.order(created_at: :desc)
  end
  
  def about
  end
end
