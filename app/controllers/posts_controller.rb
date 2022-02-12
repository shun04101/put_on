class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
  # 投稿とタグ履歴一覧画面
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = @user.posts.all.order(created_at: :desc).page(params[:page]).per(5)
    @tag_list = Tag.all
  end
  
  # 投稿情報入力画面
  def new
    @post = Post.new
    # 親モデル.子モデル.buildで子モデルのインスタンス作成
    @sites = @post.sites.build
    @tags = @post.tags.new
  end
  
  # 投稿新規登録
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.tag_name = params[:post][:tag_name]
    if @post.save
      # @post.save_tag(post_tag_name_params[:tag_name].split(','))
      redirect_to posts_path(@post.id, user_id: @post.user.id)
      flash[:success] = "コーディネートを新規登録しました！"
    else
      render :new
    end
  end
  
  # 投稿履歴詳細
  def show
    @post = Post.find(params[:id])
    @post_tags = @post.tags
  end
  
  # タグで投稿を絞り込み表示
  def search_tag
    #検索結果画面でもタグ一覧表示
    @tag_list = Tag.all
    #検索されたタグを受け取る
    @tag = Tag.find(params[:tag_id])
    #検索されたタグに紐づく投稿を表示
    @posts = @tag.posts.page(params[:page]).per(10)
  end
  
  # 投稿編集画面
  def edit
    @post = Post.find(params[:id])
    @tag_list = @post.tags.pluck(:tag_name).join(',')
  end
  
  # 投稿内容更新
  def update
    @post = Post.find(params[:id])
    @post.tag_name = params[:post][:tag_name]
    if @post.update(post_params)
      redirect_to user_posts_path(@post.user.id)
      flash[:success] = "コーディネート情報を変更しました！"
    else
      render :edit
    end
  end
  
  # 投稿削除
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path(user_id: @post.user.id)
    flash[:success] = "選択された投稿を削除しました"
  end
  
  private
  
  def post_params
    params.require(:post).permit(
      :title,
      :comment,
      :image,
      sites_attributes: [:id, :link, :info, :_destroy]
    )
  end
  
  def post_tag_name_params
    params.require(:post).permit(:tag_name)
  end

end
