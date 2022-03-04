class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def index
    @post = post.includes(:user)
  end

  def show
  end

  def edit
  end

  private

  def post_params
    params.requier(:post).permit(:user_id, :title, :production_period, :cost, :difficulty, :explanation, :photo)
  end
end
