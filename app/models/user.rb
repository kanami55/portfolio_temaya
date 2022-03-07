class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #アソシエーション
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  #フォローした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  #一覧画面で使用
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :relationships, source: :follower

  #ActiveStrage使用宣言
   has_one_attached :profile_image

    def get_profile_image
     (profile_image_attachment) ? profile_image: "no_image.jpg"
    end

    #ユーザ「いいね」しているか判別
    def already_liked?(post)
      self.likes.exists?(post_id: post.id)
    end

    #フォローする
    def follow(user_id)
      relationships.create(followed_id: user_id)
    end

    #フォローを外す
    def unfollow(user_id)
      relationships.find_by(followed_id: user_id).destroy
    end

    #フォローしているか判定
    def following?(user)
      followings.include?(user)
    end
end
