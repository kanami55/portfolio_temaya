class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :notifications, dependent: :destroy

  validates :photo, :production_period, :cost, :explanation, :title, :difficulty, presence: true

  # ActiveStrage使用宣言
  has_one_attached :photo

  def was_attached?
    self.photo.attached?
  end

  # 検索方法分岐定義
  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE?", "#{word}")
    elsif search == "forward_match"
      @post = Post.where("title LIKE?", "#{word}%")
    elsif search == "backword_match"
      @post = Post.where("title LIKE?", "%#{word}")
    elsif search == "partial_match"
      @post = Post.where("title LIKE?", "%#{word}%")
    else
      @post = Post.all
    end
  end

  #通知メソッド
  #いいね
  def create_notification_by(current_user)
    notification = current_user.active_notifications.new(
      post_id: id,
      visited_id: user_id,
      action: "like"
    )
    notification.save if notification.valid?
  end
  #コメント
  def create_notification_post_comment!(current_user, post_comment_id)
    #コメントしている人を全て取得し、全員に通知を送る
    temp_ids = PostComment.(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do | temp_id |
      save_notification_post_comment!(current_user,post_comment_id,temp_id['user_id'])
    end
    #まだだれもコメントしていない場合は投稿者に通知を送る
    save_notification_post_comment!(current_user,post_comment_id,user_id) if temp_ids.blank?
  end

  def save_notification_post_comment!(current_user,post_comment_id,visited_id)
    #コメントは複数回することが考えられる為、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      post_id: id,
      post_comment_id: post_comment_id,
      visited_id: visited_id,
      action: 'post_comment'
    )

    if notification.visitor_id == notification_visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
