class RelationshipsController < ApplicationController
  before_action :authenticate_user!, except: [:create, :destroy]

  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
    @user = User.find(params[:following_id])
    current_user.follow(@user)
    @user.create_notification_follow!(current_user)
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end
end
