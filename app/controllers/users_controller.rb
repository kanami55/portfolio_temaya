class UsersController < ApplicationController

 def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to user_path
  end

  def index
    @post = Post.includes(:user)
  end

  def show
  end

  #def edit
  #end

  private
  def user_params
    params.reqier(:user).permit(:profile_image, :introduction, :name)
  end
end
