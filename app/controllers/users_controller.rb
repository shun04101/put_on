class UsersController < ApplicationController
  
  #会員マイページ画面を表示
  def show
    @user = User.find(params[:id])
  end

  #会員情報編集
  def edit
    @user = current_user
  end

  #会員情報更新
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  #会員退会画面を表示
  def unsubscribe
  end

  #会員退会作業
  def withdraw
    @user = current_user
    ## is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行しました" ## 該当viewファイルへ<%= notice %>を
    redirect_to root_path

  end

  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :password, :email, :is_deleted)
  end
end
