class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id #ログインユーザーのIDを代入
    if @post.save
      flash[:notice] = '投稿しました'
      redirect_to root_path # 一時的にトップページへリダイレクト（要修正）
    else
      flash[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
