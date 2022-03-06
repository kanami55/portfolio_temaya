class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  #ActiveStrage使用宣言
   has_one_attached :profile_image

    def get_profile_image
     (profile_image_attachment) ? profile_image: "no_image.jpg"
    end

end
