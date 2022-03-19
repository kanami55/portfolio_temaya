class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  # ユニーク制約・一意性「1ユーザー」「１ユーザー」に対して「１フォロー」
  validates :follower_id, presence: true, uniqueness: { scope: :followed_id }
  validates :followed_id, presence: true
end
