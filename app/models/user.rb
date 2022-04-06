class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :post_comments, dependent: :destroy
  # フォローした、されたの関係
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 一覧画面で使用
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人
  # DM機能
  has_many :user_rooms, dependent: :destroy
  has_many :chats, dependent: :destroy
  #通知機能
  #自分が作った通知
  has_many :active_notifications, class_name: "Notifications", foreign_key: "visitor_id", dependent: :destroy
  #自分宛の通知
  has_many :passive_notifications, class_name: "Notifications", foreign_key: "visited_id", dependent: :destroy

  # バリデーション
  validates :email, uniqueness: true, presence: true
  validates :name, uniqueness: true, presence: true
  validates :introduction, length: { maximum: 140 }

  # ActiveStrage使用
  has_one_attached :profile_image

  def get_profile_image
    (profile_image_attachment) ? profile_image : "no_image.jpg"
  end

  # ゲストログイン機能
  def self.guest
    find_or_create_by!(name: 'guestuser', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end

  # ユーザ「いいね」しているか判別
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

  # ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end

  # 検索方法分岐定義
  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("name LIKE?", "#{word}%")
    elsif search == "backword_match"
      @user = User.where("name LIKE?", "%#{word}")
    elsif search == "partial_match"
      @user = User.where("name LIKE?", "%#{word}%")
    else
      @user = User.all
    end
  end

  # 退会済みユーザは同じアカウントでログイン出来ない
  def active_for_authentication?
    super && (is_deleted == false)
  end

  #フォローのメソッド
  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ?, current_user.id, id, 'follow"])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end
end
