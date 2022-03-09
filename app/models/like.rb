class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  #「１ユーザ」「１記事」「１回のみいいね」ユニーク制約・一意性
  validates_uniqueness_of :post_id, scope: :user_id
end
