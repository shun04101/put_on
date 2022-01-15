class HomesController < ApplicationController
  def top
    @posts = Post.all.order(created_at: :desc)
    # @post = Post.find_by( id: params[:user_id])
    # @post_tags = @post.tags
  end
  
  def about
  end
end
