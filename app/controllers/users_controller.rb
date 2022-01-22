class UsersController < ApplicationController
  
  #会員マイページ画面を表示
  def show
    @user = User.find(params[:id])
    # @posts = @user.posts
    @posts = @user.posts.all.order(created_at: :desc).limit(2)
    if user_signed_in?
      @bookmarks = Bookmark.where(user_id: current_user.id).page(params[:page]).per(3)
    end
  end

  #会員情報編集
  def edit
    @user = current_user
  end

  #会員情報更新
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:primary] = "会員情報更新しました"
      redirect_to user_path
    else
        render :edit
    end
  end

  #会員退会画面を表示
  def unsubscribe
  end

  #会員退会作業
  def withdraw
    @user = current_user
    ## is_deletedカラムをtrueに変更することにより削除フラグを立てる
    if @user.update(is_deleted: true)
      @user.posts.each do |post|
        post.destroy!
      end
      reset_session
      flash[:notice] = "退会しました。またのご利用をお待ちしております" ## 該当viewファイルへ<%= notice %>を
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :password, :email, :is_deleted)
  end
end
