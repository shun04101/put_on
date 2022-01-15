class BookmarksController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @post = Post.find(params[:post_id])
    @bookmark = @post.bookmarks.new(user_id: current_user.id)
    if @bookmark.save
    else
      # 非同期処理を行うため投稿が成功した場合はリロードせずに返します。投稿失敗した場合に現在いるページにリダイレクトされる
      redirect_to request.referer
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @bookmark = @post.bookmarks.find_by(user_id: current_user.id)
    # 既にブックマーク済かどうか判断。ブックマーク済なら、削除
    if @bookmark.present?
      @bookmark.destroy
    else
      redirect_to request.referer
    end
  end
end
