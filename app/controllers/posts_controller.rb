class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿に成功しました！"
      redirect_to posts_path
    else
      render new_post_path
    end
  end

  def index
    @posts = Post.includes(:liked_users).sort { |a, b| b.liked_users.size <=> a.liked_users.size }
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @user = current_user
    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.save
      flash[:notice] = "更新に成功しました！"
      redirect_to post_path(@post)
    else
      render "edit"
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :production_period, :cost, :difficulty, :explanation, :photo)
  end
end
