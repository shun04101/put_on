class SearchesController < ApplicationController
  
  def search
    @posts = Post.all.order(created_at: :desc)
    @range = params[:range]
    # binding.pry
    if @range == "PostTags"
      @item = "タグ"
    else
      @item = "タイトル"
    end
    search = params[:search]
    @word = params[:word]
    # binding.pry
    if @range == 'Posts'
      @post = Post.search(search, @word)
    else
      @tags = Tag.search(search, @word)
      @post_tags = PostTag.where(tag_id: @tags.map(&:id))
    end
  end
end
