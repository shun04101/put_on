class TimelineController < ApplicationController
  
  # タイムライン画面表示
  def index
    @user_ids = current_user.followings.ids
    @posts = Post.where(user_id: @user_ids.push(current_user.id)).order(created_at: :desc)
  end
end
