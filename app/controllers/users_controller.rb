class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path
    else
      render "edit"
    end
  end

  def index
    @posts = Post.includes(:user)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    if user.save
      redirect_to user_path(user.id)
    else
      render "edit"
    end
  end

  def follows
    @user = User.find(params[:id])
    @users = @user.following_user
    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.follower_user
    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end

  private

  def user_params
    params.require(:user).permit(:profile_image, :introduction, :name)
  end
end
