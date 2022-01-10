class PostsController < ApplicationController
  
  def index
    @posts = Post.all
    @tag_list = Tag.all
  end
  
  def new
    @post = Post.new
    # @user = User.find(params[:user_id])
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    tag_list = params[:post][:tag_name].split(',')
    if @post.save
      @post.save_tag(tag_list)
      redirect_to posts_path(@post.id)
      flash[:success] = "コーディネートを新規登録しました！"
    else
      render :new
    end
  end
  
  def show
    @post = Post.find(params[:id])
    @post_tags = @post.tags
  end
  
  def search_tag
    #検索結果画面でもタグ一覧表示
    @tag_list = Tag.all
    #検索されたタグを受け取る
    @tag = Tag.find(params[:tag_id])
    #検索されたタグに紐づく投稿を表示
    @posts = @tag.posts.page(params[:page]).per(10)
  end
  
  def edit
    @post = Post.find(params[:id])
    @tag_list = @post.tags.pluck(:tag_name).join(',')
  end
  
  def update
    @post = Post.find(params[:id])
    # 入力されたタグを受け取る
    tag_list = params[:post][:tag_name].split(',')
    if @post.update(post_params)
      @old_relations=PostTag.where(post_id: @post.id)
      @old_relations.each do |relation|
        relation.delete
      end
      @post.save_tag(tag_list)
      redirect_to posts_path(@post.id)
      flash[:success] = "変更を保存しました！"
    else
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :comment, :image, :tag, :site)
  end
  
end
