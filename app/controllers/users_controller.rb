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
    @post = Post.includes(:user)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
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

  private

  def user_params
    params.require(:user).permit(:profile_image, :introduction, :name)
  end
end