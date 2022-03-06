class Post < ApplicationRecord
  #アソシエーション
  belongs_to :user
  has_many :likes

  #ActiveStrage使用宣言
  has_one_attached :photo

  def was_attached?
    self.photo.attached?
  end

end
