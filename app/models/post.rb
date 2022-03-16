class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  validates :photo, :production_period, :cost, :explanation, :title, presence: true


  #ActiveStrage使用宣言
  has_one_attached :photo

  def was_attached?
    self.photo.attached?
  end

  #検索方法分岐定義
  def self.looks(search,word)
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

end
