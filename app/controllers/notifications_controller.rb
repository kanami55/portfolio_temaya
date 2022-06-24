class NotificationsController < ApplicationController

  def index
    #current_userの投稿に紐づいた通知一覧
    @notifications = current_user.passive_notifications
    #@notificationsの中でまだ確認していない(indexに一度も遷移していない)通知のみ
    @notifications.where(checked: false).each do |notification|
      notification.update_attribute(checked: true)
    end
  end
  #通知を全削除
  def destroy_all
    @notifications = current_user.passive_notifications.destroy_all
    redirect_to users_notifications_path
  end
end
