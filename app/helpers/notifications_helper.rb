module NotificationsHelper
  def notification_form(notification)
    @visiter = notification.visiter
    @post_comment = nil
    #your_post = link_to 'あなたの投稿', users_post_path(notification), style:"font-weight: bold;"
    @visiter_post_comment = notification.post_comment_id
    #notification.actionがfollowかlikeかcommentか
    case notification.action
    when "follow" then
    tag.a(notification.visiter.name, href:users_user_path(@visiter), style:"font-weight: bold;")+"があなたをフォローしました"
    when "like" then
    tag.a(notification.visiter.name, href:users_user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:users_post_path(notification.post_id), style:"font-weight: bold;")+"にいいねしました"
    when "post_comment" then
    @post_comment = PostComment.find_by(id: @visiter_comment)&.content
    tag.a(@visiter.name, href:users_user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:users_post_path(notification.post_id), style:"font-weight: bold;")+"にコメントしました"
    end
  end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end
