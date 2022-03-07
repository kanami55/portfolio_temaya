class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #アソシエーション
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :post_comments, dependent: :destroy


  #ActiveStrage使用宣言
   has_one_attached :profile_image

    def get_profile_image
     (profile_image_attachment) ? profile_image: "no_image.jpg"
    end

    #ユーザ「いいね」しているか判別
    def already_liked?(post)
      self.likes.exists?(post_id: post.id)
    end


end
