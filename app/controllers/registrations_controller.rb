class RegistrationsController < ApplicationController

protected
  # アカウント編集後、ユーザーの詳細画面に遷移
  def after_update_path_for(resource)
    user_path(id: current_user.id)
  end
end
