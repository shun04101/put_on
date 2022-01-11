class SearchesController < ApplicationController
  
  def search
    @range = params[:range]
    search = params[:search]
    @word = params[:word]
    if @range == 'Posts'
      @post = Post.search(search, @word)
    else
      @tags = Tag.search(search, @word)
      @post_tags = PostTag.where(tag_id: @tags.map(&:id))
    end
  end
end
