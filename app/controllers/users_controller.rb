class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :ensure_guest_user, only: [:edit]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path
    else
      render :edit
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
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = "更新に成功しました。"
      redirect_to user_path(@user.id)
    else
      render :edit
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

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end
