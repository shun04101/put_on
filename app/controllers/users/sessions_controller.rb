# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :user_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
  protected
  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  
  # 退会してるかの判断をするメソッド && 会員の論理削除のための記述。退会後は、同じアカウントでは利用できない。
  def user_state
    ## 【処理内容1】入力されたemailからアカウントを1件取得
    @user = User.find_by(email:params[:user][:email])
    #(36-37の別解) 顧客情報が取得できなければ、何もしない。問題なければ次の処理
    #(36-37の別解) if  @user = User.find_by(email:params[:user][:email])
    ## アカウントを取得できなかったら終了
    return if !@user
    ## 【処理内容2】取得したアカウントのパスワードと入力されたパスワードが一致しているかを判別
    if @user.valid_password?(params[:user][:password])
      ## 【処理内容3】退会していた場合の処理
      if @user.is_deleted == true
        flash[:danger] = "退会済みアカウントではログイン出来ません。再度新規登録を行なってください。"
        redirect_to new_user_registration_path
      end
    end
  end
end
