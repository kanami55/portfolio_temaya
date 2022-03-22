class Admin::UsersController < ApplicationController
  #管理者のみしか見れない
  before_action :admin
  #登録ユーザーを日付順で見れる
  def index
    @users = User.all.oder(created_at: :desc)
  end

  private

  def admin
    redirect_to(root_url) unless current_user.admin?
  end
end
