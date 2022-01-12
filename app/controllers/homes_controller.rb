class HomesController < ApplicationController
  def top
    @posts = Post.all
    # @post = Post.find(params[:id])
    # @post_tags = @post.tags
  end
  
  def about
  end
end
