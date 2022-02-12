class SearchesController < ApplicationController
  
  # 検索機能
  def search
    @range = params[:range]
    @item = if @range == 'PostTags'
       "タグ"
      else
       "タイトル"
      end
    # ５行目〜９行目までの別解
    # if @range == "PostTags"
    #   @item = "タグ"
    # else
    #   @item = "タイトル"
    # end
    search = params[:search]
    @word = params[:word]
    if @range == 'Posts'
      @post = Post.search(search, @word)
    else
      @tags = Tag.search(search, @word)
    end
  end
end
