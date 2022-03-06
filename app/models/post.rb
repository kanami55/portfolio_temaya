class Post < ApplicationRecord
  #アソシエーション
  belongs_to :user
  has_many :likes

  #ActiveStrage使用宣言
  has_one_attached :photo

  def was_attached?
    self.photo.attached?
  end
  
  #likeテーブル内にuser_idがあるか判断
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
