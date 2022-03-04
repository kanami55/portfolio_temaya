class Post < ApplicationRecord
  belongs_to :user
   belongs_to :user
  #ActiveStrage使用宣言
  has_one_attached :photo

  def was_attached?
    self.photo.attached?
  end
end
