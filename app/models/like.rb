class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  #「１ユーザ」「１記事」「１回のみいいね」ユニーク制約・一意性
  validates :user_id, presence: true
  validates :post_id, presence: true, uniqueness: { scope: :user_id }
end
