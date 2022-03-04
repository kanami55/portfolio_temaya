class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path(@post)
    else
      render new_post_path
    end
  end

  def index
    @post = Post.includes(:user)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:title, :production_period, :cost, :difficulty, :explanation, :photo).merge(user_id: current_user.id)
  end
end
